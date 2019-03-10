class DriverNotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "driver_notifications_channel"
  end
end
