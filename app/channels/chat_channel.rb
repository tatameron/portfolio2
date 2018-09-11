class ChatChannel < ApplicationCable::Channel
 def subscribed
    stream_from 'all'
    stream_for current_user
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def create_message(data)
    if data['message'].match(/\@[a-zA-Z0-9_]+/)
      name = data['message'].match(/\@[a-zA-Z0-9_]+/).to_s.gsub('@', '')
      user = User.find_by_name(name)
      ChatChannel.broadcast_to(user, {name: current_user.name, content: data['message']})
    else
      ActionCable.server.broadcast 'all', {name: current_user.name, content: data['message']}
    end
  end
end