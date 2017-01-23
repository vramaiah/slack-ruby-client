# This file was auto-generated by lib/tasks/web.rake

desc "Get info on your team's Slack channels, create or archive channels, invite users, set the topic and purpose, and mark a channel as read."
command 'channels' do |g|
  g.desc 'This method archives a channel.'
  g.long_desc %( This method archives a channel. )
  g.command 'archive' do |c|
    c.flag 'channel', desc: 'Channel to archive.'
    c.action do |_global_options, options, _args|
      puts JSON.dump($client.channels_archive(options))
    end
  end

  g.desc 'This method is used to create a channel.'
  g.long_desc %( This method is used to create a channel. )
  g.command 'create' do |c|
    c.flag 'name', desc: 'Name of channel to create.'
    c.action do |_global_options, options, _args|
      puts JSON.dump($client.channels_create(options))
    end
  end

  g.desc 'This method returns a portion of message events from the specified channel.'
  g.long_desc %( This method returns a portion of message events from the specified channel. )
  g.command 'history' do |c|
    c.flag 'channel', desc: 'Channel to fetch history for.'
    c.flag 'latest', desc: 'End of time range of messages to include in results.'
    c.flag 'oldest', desc: 'Start of time range of messages to include in results.'
    c.flag 'inclusive', desc: 'Include messages with latest or oldest timestamp in results.'
    c.flag 'unreads', desc: 'Include unread_count_display in the output?.'
    c.action do |_global_options, options, _args|
      puts JSON.dump($client.channels_history(options))
    end
  end

  g.desc 'This method returns information about a team channel.'
  g.long_desc %( This method returns information about a team channel. )
  g.command 'info' do |c|
    c.flag 'channel', desc: 'Channel to get info on.'
    c.action do |_global_options, options, _args|
      puts JSON.dump($client.channels_info(options))
    end
  end

  g.desc 'This method is used to invite a user to a channel. The calling user must be a member of the channel.'
  g.long_desc %( This method is used to invite a user to a channel. The calling user must be a member of the channel. )
  g.command 'invite' do |c|
    c.flag 'channel', desc: 'Channel to invite user to.'
    c.flag 'user', desc: 'User to invite to channel.'
    c.action do |_global_options, options, _args|
      puts JSON.dump($client.channels_invite(options))
    end
  end

  g.desc 'This method is used to join a channel. If the channel does not exist, it is'
  g.long_desc %( This method is used to join a channel. If the channel does not exist, it is created. )
  g.command 'join' do |c|
    c.flag 'name', desc: 'Name of channel to join.'
    c.action do |_global_options, options, _args|
      puts JSON.dump($client.channels_join(options))
    end
  end

  g.desc 'This method allows a user to remove another member from a team channel.'
  g.long_desc %( This method allows a user to remove another member from a team channel. )
  g.command 'kick' do |c|
    c.flag 'channel', desc: 'Channel to remove user from.'
    c.flag 'user', desc: 'User to remove from channel.'
    c.action do |_global_options, options, _args|
      puts JSON.dump($client.channels_kick(options))
    end
  end

  g.desc 'This method is used to leave a channel.'
  g.long_desc %( This method is used to leave a channel. )
  g.command 'leave' do |c|
    c.flag 'channel', desc: 'Channel to leave.'
    c.action do |_global_options, options, _args|
      puts JSON.dump($client.channels_leave(options))
    end
  end

  g.desc 'This method returns a list of all channels in the team. This includes channels the caller is in, channels they are not currently in, and archived channels but does not include private channels. The number of (non-deactivated) members in each channel is also returned.'
  g.long_desc %( This method returns a list of all channels in the team. This includes channels the caller is in, channels they are not currently in, and archived channels but does not include private channels. The number of (non-deactivated) members in each channel is also returned. )
  g.command 'list' do |c|
    c.flag 'exclude_archived', desc: "Don't return archived channels."
    c.action do |_global_options, options, _args|
      puts JSON.dump($client.channels_list(options))
    end
  end

  g.desc 'This method moves the read cursor in a channel.'
  g.long_desc %( This method moves the read cursor in a channel. )
  g.command 'mark' do |c|
    c.flag 'channel', desc: 'Channel to set reading cursor in.'
    c.flag 'ts', desc: 'Timestamp of the most recently seen message.'
    c.action do |_global_options, options, _args|
      puts JSON.dump($client.channels_mark(options))
    end
  end

  g.desc 'This method renames a team channel.'
  g.long_desc %( This method renames a team channel. )
  g.command 'rename' do |c|
    c.flag 'channel', desc: 'Channel to rename.'
    c.flag 'name', desc: 'New name for channel.'
    c.action do |_global_options, options, _args|
      puts JSON.dump($client.channels_rename(options))
    end
  end

  g.desc 'This method returns an entire thread (a message plus all the messages in reply to it).'
  g.long_desc %( This method returns an entire thread (a message plus all the messages in reply to it). )
  g.command 'replies' do |c|
    c.flag 'channel', desc: 'Channel to fetch thread from.'
    c.flag 'thread_ts', desc: "Unique identifier of a thread's parent message."
    c.action do |_global_options, options, _args|
      puts JSON.dump($client.channels_replies(options))
    end
  end

  g.desc 'This method is used to change the purpose of a channel. The calling user must be a member of the channel.'
  g.long_desc %( This method is used to change the purpose of a channel. The calling user must be a member of the channel. )
  g.command 'setPurpose' do |c|
    c.flag 'channel', desc: 'Channel to set the purpose of.'
    c.flag 'purpose', desc: 'The new purpose.'
    c.action do |_global_options, options, _args|
      puts JSON.dump($client.channels_setPurpose(options))
    end
  end

  g.desc 'This method is used to change the topic of a channel. The calling user must be a member of the channel.'
  g.long_desc %( This method is used to change the topic of a channel. The calling user must be a member of the channel. )
  g.command 'setTopic' do |c|
    c.flag 'channel', desc: 'Channel to set the topic of.'
    c.flag 'topic', desc: 'The new topic.'
    c.action do |_global_options, options, _args|
      puts JSON.dump($client.channels_setTopic(options))
    end
  end

  g.desc 'This method unarchives a channel. The calling user is added to the channel.'
  g.long_desc %( This method unarchives a channel. The calling user is added to the channel. )
  g.command 'unarchive' do |c|
    c.flag 'channel', desc: 'Channel to unarchive.'
    c.action do |_global_options, options, _args|
      puts JSON.dump($client.channels_unarchive(options))
    end
  end

  g.desc 'This method returns the ID of a team channel.'
  g.long_desc %( This method returns the ID of a team channel. )
  g.command 'id' do |c|
    c.flag 'channel', desc: 'Channel to get ID for, prefixed with #.'
    c.action do |_global_options, options, _args|
      puts JSON.dump($client.channels_id(options))
    end
  end
end
