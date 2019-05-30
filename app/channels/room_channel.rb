class RoomChannel < ApplicationCable::Channel
  def subscribed
    reject unless connection.current_user
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
