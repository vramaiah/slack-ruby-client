# frozen_string_literal: true
# This file was auto-generated by lib/tasks/web.rake

require 'spec_helper'

RSpec.describe Slack::Web::Api::Endpoints::Mpim do
  let(:client) { Slack::Web::Client.new }
  context 'mpim_close' do
    it 'requires channel' do
      expect { client.mpim_close }.to raise_error ArgumentError, /Required arguments :channel missing/
    end
  end
  context 'mpim_history' do
    it 'requires channel' do
      expect { client.mpim_history }.to raise_error ArgumentError, /Required arguments :channel missing/
    end
  end
  context 'mpim_mark' do
    it 'requires channel' do
      expect { client.mpim_mark(ts: %q[1593473566.000200]) }.to raise_error ArgumentError, /Required arguments :channel missing/
    end
    it 'requires ts' do
      expect { client.mpim_mark(channel: %q[C012345678]) }.to raise_error ArgumentError, /Required arguments :ts missing/
    end
  end
  context 'mpim_open' do
    it 'requires users' do
      expect { client.mpim_open }.to raise_error ArgumentError, /Required arguments :users missing/
    end
  end
  context 'mpim_replies' do
    it 'requires channel' do
      expect { client.mpim_replies(thread_ts: %q[1234567890.123456]) }.to raise_error ArgumentError, /Required arguments :channel missing/
    end
    it 'requires thread_ts' do
      expect { client.mpim_replies(channel: %q[C1234567890]) }.to raise_error ArgumentError, /Required arguments :thread_ts missing/
    end
  end
end
