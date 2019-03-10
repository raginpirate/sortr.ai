class DriverController < ApplicationController

  def new
    #@driver = Driver.new
  end

  def create
    @driver = Driver.create driver_params
    render :ready
  end

  def ready
    puts "Driver " + @driver.name + " is ready"
  end

  def sorted
    SortingRequest.find(params[:id]).update(sorted_list: params[:sortedList])
  end

private

  def driver_params
    params.require(:driver).permit(:name)
  end
end
