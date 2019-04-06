require 'async/websocket'
require 'async/clock'

module Slack
  module RealTime
    module Concurrency
      module Async
        class Client < ::Async::WebSocket::Client
          extend ::Forwardable
          def_delegators :@driver, :on, :text, :binary, :emit
        end

        class Socket < Slack::RealTime::Socket
          attr_reader :client

          def start_async(client)
            @reactor = ::Async::Reactor.new
            
            Thread.new do
              @reactor.run do |task|
                if client.run_ping?
                  task.async do |subtask|
                    subtask.annotate "client keep-alive"
                    
                    while true
                      subtask.sleep client.websocket_ping
                      client.run_ping!
                    end
                  end
                end
                
                task.async do |subtask|
                  subtask.annotate "client run-loop"
                  client.run_loop
                end
              end
            end
          end

          def restart_async(client, new_url)
            @url = new_url
            @last_message_at = current_time
            return unless @reactor

            @reactor.async do
              client.run_loop
            end
          end

          def current_time
            ::Async::Clock.now
          end

          def connect!
            super
            run_loop
          end

          # Close the socket.
          def close
            @socket.close if @socket
            super
          end

          def run_loop
            while @driver && @driver.next_event
              # $stderr.puts event.inspect
            end
          end

          protected

          def build_ssl_context
            OpenSSL::SSL::SSLContext.new(:TLSv1_2_client).tap do |ctx|
              ctx.set_params(verify_mode: OpenSSL::SSL::VERIFY_PEER)
            end
          end

          def build_endpoint
            endpoint = ::Async::IO::Endpoint.tcp(addr, port)
            endpoint = ::Async::IO::SSLEndpoint.new(endpoint, ssl_context: build_ssl_context) if secure?
            endpoint
          end

          def connect_socket
            build_endpoint.connect
          end

          def connect
            @socket = connect_socket
            @driver = Client.new(@socket, url)
          end
        end
      end
    end
  end
end
