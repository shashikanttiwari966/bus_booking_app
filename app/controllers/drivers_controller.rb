class DriversController < ApplicationController

  def new
    @bus = Bus.find_by_id(params[:bus_id])
    @driver = @bus.drivers.build
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @bus = Bus.find_by_id(params[:bus_id])
    @driver = @bus.drivers.create(driver_params)
    redirect_to buses_path(), notice:"Driver added for your #{@bus.bus_name}!"
  end

  def edit
    
  end

  def update
    
  end

  def show

  end

  private

  def driver_params
    params.require(:driver).permit(:name, :age, :contact_no, :license, :image, :bus_id)
  end
end
