class BusServicesController < ApplicationController
  def index
  end

  def new
    @bus = Bus.find_by_id(params[:bus_id])
    @bus_service = @bus.build_bus_service
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @bus = Bus.find_by_id(params[:bus_id])
    @bus_service = @bus.build_bus_service(bus_service_params)
    if @bus_service.save
      redirect_to buses_path(), notice:"Bus Service is Generated!"
    end
  end

  def edit
    @bus = Bus.find_by_id(params[:bus_id])
    @bus_service = @bus.bus_service
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @bus = Bus.find_by_id(params[:bus_id])
    if @bus.bus_service.update(bus_service_params)
      redirect_to buses_path(), notice:"Bus Service is updated!"
    end
  end

  private

  def bus_service_params
    params.require(:bus_service).permit(:bus_id, :ac, :tv, :washroom, :wifi, :food, :blanket)
  end
end
