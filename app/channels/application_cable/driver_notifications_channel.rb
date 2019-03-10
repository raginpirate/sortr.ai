class DriverNotificationsChannel < ApplicationCable::Channel
  def subscribed
    puts "NICE"
    stream_from "driver_channel"
  end
end
