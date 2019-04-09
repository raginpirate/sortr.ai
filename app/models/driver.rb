class Driver < ApplicationRecord
  scope :available_to_work, -> { where sorting_request: nil }

  def self.broadcast_sorting_request(sorting_request)
    ActionCable.server.broadcast("driver_channel", {
        id: sorting_request.id,
        type: :create,
        list: sorting_request.unsorted_list,
        options: sorting_request.options
    })
  end

  def self.broadcast_sorting_deletion(sorting_request_id)
    ActionCable.server.broadcast("driver_channel", {
        id: sorting_request_id,
        type: :destroy
    })
  end
end
