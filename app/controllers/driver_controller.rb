class DriverController < ApplicationController

  def new
    #@driver = Driver.new
  end

  def create
    @driver = Driver.find_by(name: driver_params[:name]) || Driver.create(driver_params)
    render :ready
  end

  def ready
    puts "Driver " + @driver.name + " is ready"
  end

  def sorted
    SortingRequest.find(params[:id]).update(sorted_list: params[:sortedList])
    Driver.find_by(name: params[:name]).increment!(:vbucks, by = 1)
  end

private

  def driver_params
    params.require(:driver).permit(:name)
  end
end
