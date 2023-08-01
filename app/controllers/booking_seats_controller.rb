class BookingSeatsController < ApplicationController

  def create
    @bus = Bus.find_by_id(params[:booking][:bus_id])
    @schedule = @bus.schedules.find_by_id(params[:booking][:schedule_id])
    # params[:booking][:seat_name] = params[:seats].first
    @booking = @bus.bookings.create(booking_params)
    
    if params[:payment_type].eql?("online")
      # StripePayment.new(bus: @bus, schedule: @schedule, booking: @booking).create_payment
      @session = create_payment(params[:seats].first)
      respond_to do |format|
        format.html
        format.js
      end
    else
      @booking.update(seat_name: params[:seats].first)
      @schedule.update(available_seat: (@schedule.available_seat - params[:seats].count))
      redirect_to buses_path(), notice:"Booking successfully!"
    end
  end

  def sucess
    booking = Booking.find_by_id(params[:booking_id])
    booking.update(seat_name: params[:seats])
    schedule = Schedule.find_by_id(params[:schedule_id])
    schedule.update(available_seat: (schedule.available_seat - 1))
    redirect_to root_url, notice:"Booking successfully!"
  end

  def cancel
    redirect_to root_url, notice: "Booking Failed, Something went wrong!"
  end

  private

  def book_bus(booking_params)
    @booking = @bus.bookings.create(booking_params)
  end

  def create_payment(seat_name)
    begin
      session = Stripe::Checkout::Session.create({
        payment_method_types: ['card'],
        line_items: [{
          name: seat_name,
          amount: 100 * 100,
          currency: "inr",
          description: "Seat Booking: Your bus name is #{@bus.bus_name.upcase} and your Seat name is #{seat_name}",
          quantity: 1,
        }],
        mode: 'payment',
        success_url: "https://6aad-103-106-31-11.ngrok-free.app/booking_seats/sucess?bus_id=#{@bus.id}&schedule_id=#{@schedule.id}&seats=#{seat_name}&booking_id=#{@booking.id}",
        cancel_url: "https://6aad-103-106-31-11.ngrok-free.app/booking_seats/cancel",
      })
      return session
    rescue Stripe::StripeError => e
      return redirect_to root_path , alert:"#{e.message}"
    end
  end

  def booking_params
    params.require(:booking).permit(:schedule_id, :bus_id, :start_location, :end_location, :seat_name, passengers_attributes:[:id, :first_name, :last_name, :contact_no, :address, :age, :booking_id, :_destroy])
  end
end
