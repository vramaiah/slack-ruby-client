# frozen_string_literal: true
# This file was auto-generated by lib/tasks/web.rake

desc 'Get info on your direct messages.'
command 'im' do |g|
  g.desc 'Close a direct message channel.'
  g.long_desc %( Close a direct message channel. )
  g.command 'close' do |c|
    c.flag 'channel', desc: 'Direct message channel to close.'
    c.action do |_global_options, options, _args|
      puts JSON.dump($client.im_close(options))
    end
  end

  g.desc 'Fetches history of messages and events from direct message channel.'
  g.long_desc %( Fetches history of messages and events from direct message channel. )
  g.command 'history' do |c|
    c.flag 'channel', desc: 'Direct message channel to fetch history for.'
    c.flag 'inclusive', desc: 'Include messages with latest or oldest timestamp in results.'
    c.flag 'latest', desc: 'End of time range of messages to include in results.'
    c.flag 'oldest', desc: 'Start of time range of messages to include in results.'
    c.flag 'unreads', desc: 'Include unread_count_display in the output?.'
    c.action do |_global_options, options, _args|
      puts JSON.dump($client.im_history(options))
    end
  end

  g.desc 'Lists direct message channels for the calling user.'
  g.long_desc %( Lists direct message channels for the calling user. )
  g.command 'list' do |c|
    c.flag 'cursor', desc: "Paginate through collections of data by setting the cursor parameter to a next_cursor attribute returned by a previous request's response_metadata. Default value fetches the first 'page' of the collection. See pagination for more detail."
    c.flag 'limit', desc: "The maximum number of items to return. Fewer than the requested number of items may be returned, even if the end of the users list hasn't been reached."
    c.action do |_global_options, options, _args|
      puts JSON.dump($client.im_list(options))
    end
  end

  g.desc 'Sets the read cursor in a direct message channel.'
  g.long_desc %( Sets the read cursor in a direct message channel. )
  g.command 'mark' do |c|
    c.flag 'channel', desc: 'Direct message channel to set reading cursor in.'
    c.flag 'ts', desc: 'Timestamp of the most recently seen message.'
    c.action do |_global_options, options, _args|
      puts JSON.dump($client.im_mark(options))
    end
  end

  g.desc 'Opens a direct message channel.'
  g.long_desc %( Opens a direct message channel. )
  g.command 'open' do |c|
    c.flag 'user', desc: 'User to open a direct message channel with.'
    c.flag 'include_locale', desc: 'Set this to true to receive the locale for this im. Defaults to false.'
    c.flag 'return_im', desc: 'Boolean, indicates you want the full IM channel definition in the response.'
    c.action do |_global_options, options, _args|
      puts JSON.dump($client.im_open(options))
    end
  end

  g.desc 'Retrieve a thread of messages posted to a direct message conversation'
  g.long_desc %( Retrieve a thread of messages posted to a direct message conversation )
  g.command 'replies' do |c|
    c.flag 'channel', desc: 'Direct message channel to fetch thread from.'
    c.flag 'thread_ts', desc: "Unique identifier of a thread's parent message."
    c.action do |_global_options, options, _args|
      puts JSON.dump($client.im_replies(options))
    end
  end
end
