class StripePayment
  def initialize(bus:, schedule:, booking:)
    @bus = bus
    @schedule = schedule
    @booking = booking
  end

  def create_payment
    begin
      session = Stripe::Checkout::Session.create({
        payment_method_types: ['card'],
        line_items: [{
          name: @booking.seat_name,
          amount: 100 * 100,
          currency: "inr",
          description: "Seat Booking: Your bus name is #{@bus.bus_name.upcase} and your Seat name is #{@booking.seat_name}",
          quantity: 1,
        }],
        mode: 'payment',
        success_url: "https://6aad-103-106-31-11.ngrok-free.app/booking_seats/sucess?bus_id=#{@bus.id}&schedule_id=#{@schedule.id}&booking_id=#{@booking.id}",
        cancel_url: "https://6aad-103-106-31-11.ngrok-free.app/booking_seats/cancel",
      })

      return session.url
    rescue Stripe::StripeError => e
      return "/" #, alert:"#{e.message}"
    end
  end
end