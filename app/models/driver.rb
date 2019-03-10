class Driver < ApplicationRecord
  scope :available_to_work, -> { where sorting_request: nil }

  def self.broadcast_sorting_request(sorting_request_id)
    DriverNotificationsChannel.broadcast(
        id: sorting_request_id,
        list: sorting_request.unsorted_list,
        options: sorting_request.options
    )
  end

  def self.broadcast_sorting_deletion(sorting_request_id)
    DriverNotificationsChannel.broadcast(
        id: sorting_request_id
    )
  end
end