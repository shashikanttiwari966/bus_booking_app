class SeatsController < ApplicationController
  def show
    @bus = Bus.find_by_id(params[:bus_id])
    @booking = @bus.bookings.build
    @schedule = find_schedule(params[:schedule_id])
    @seat_name = @schedule.bookings.pluck(:seat_name)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    @seat = Seat.find_by_id(params[:id])
  end

  def update
    @seat = Seat.find_by_id(params[:id])
    @bus = @seat.bus
    respond_to do |format|
      if @seat.update(seat_params)
        format.html { redirect_to bus_url(@seat.bus, bus_seat:"bus_seat"), notice: "Seat was successfully updated." }
        format.js
        # format.json { render :show, status: :ok, location: @seat }
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@seat) }
      end
    end
  end

  private

  def seat_params
    params.require(:seat).permit(:name, :seat_type)
  end

  def find_schedule(params)
    key = params.present? ? 'id' : 'trip_date'
    value = params.present? ? params : Date.today
    @bus.schedules.find_by(key+' =?', value)
  end
end
