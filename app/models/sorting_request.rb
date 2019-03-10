class SortingRequest < ApplicationRecord
  after_create :broadcast_creation
  before_destroy :broadcast_deletion

  private

  def broadcast_creation
    Driver.broadcast_sorting_request(self)
  end

  def broadcast_deletion
    Driver.broadcast_sorting_deletion(id)
  end
end
