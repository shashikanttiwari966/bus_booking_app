module BusServicesHelper

  def get_bus_services(bus_service)
    str = ""
    str += "<div class='col-sm-2'><i class='fa fa-wifi' aria-hidden='true' data-toggle='tooltip' data-placement='top' title='Wifi'></i></div>" if bus_service.wifi?
    str += "<div class='col-sm-2'><i class='fa fa-television' aria-hidden='true' data-toggle='tooltip' data-placement='top' title='Telivision'></i></div>" if bus_service.tv?
    str += "<div class='col-sm-2'><i class='fa-solid fa-toilet' aria-hidden='true' data-toggle='tooltip' data-placement='top' title='Toilet'></i></div>" if bus_service.washroom?
    str += "<div class='col-sm-2'><i class='fa fa-snowflake-o' aria-hidden='true' data-toggle='tooltip' data-placement='top' title='Air Conditioner'></i></div>" if bus_service.ac?
    str += "<div class='col-sm-2'><i class='fas fa-cheeseburger' aria-hidden='true' data-toggle='tooltip' data-placement='top' title='Foods'></i></div>" if bus_service.food?
    str += "<div class='col-sm-2'><i class='fa-solid fa-blanket' aria-hidden='true'  data-toggle='tooltip' data-placement='top' title='Blanket'></i></div>" if bus_service.blanket?
    str
  end

  def show_trip_location(trip)
    "#{trip.pickup_location}-#{trip.destination_location}"
  end

  def google_map(center)
    "https://maps.googleapis.com/maps/api/staticmap?center=#{center}&size=300x300&zoom=17"
  end
end