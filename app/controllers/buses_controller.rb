class BusesController < ApplicationController
  before_action :authenticate_user!

  def index
    @buses = current_user.buses.order(created_at: :desc)
    authorize! :read, @buses
  end

  def new
    @bus = Bus.new
    authorize! :read, @bus
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    @bus = current_user.buses.find_by_id(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @bus = current_user.buses.find_by_id(params[:id])
  end

  def create
    @bus = current_user.buses.create(bus_params)
    redirect_to buses_path(), notice:"Bus creates successfully!"
  end

  def update
    @bus = current_user.buses.find_by_id(params[:id])
    @bus.update(bus_params)
    redirect_to buses_path(), notice:"Bus update successfully!"
  end

  private 

  def bus_params
    params.require(:bus).permit(:bus_number, :bus_name, :total_seat, :image, bus_trips_attributes:[:id, :pickup_location, :destination_location, :distance, :departure, :_destroy])
  end
end
