class DriverNotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_for current_driver
  end
end
