class Api::V1Controller < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :validate_params, only: :sorting_request
  def sorting_request
    respond_to do |format|
      start_time = Time.now
      request_obj = params[:sorting_request]
      sorting_request = SortingRequest.create(unsorted_list: request_obj["list"], options: request_obj["options"])
      while true
        if start_time < Time.now - 25.seconds
          SortingRequest.find(sorting_request.id).destroy
          format.json { render json: request_obj["list"].shuffle, status: :accepted }
          break
        else
          if sorting_request.reload.sorted_list.present?
            format.json { render json: sorting_request.sorted_list, status: :accepted }
            sorting_request.destroy
            break
          else
            sleep 1
          end
        end
      end
    end
  end

  private

  def validate_params
    # SortingRequestValidator.validate!(params[:sorting_request])
  end
end
