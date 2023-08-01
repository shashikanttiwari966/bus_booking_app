module SeatsHelper

  def get_schedules(bus)
    bus.schedules.where('trip_date >=?', Date.today)
  end

  def get_services(bus_service)
    str = ""
    str += "<div><i class='fa fa-wifi' aria-hidden='true' data-toggle='tooltip' data-placement='top' title='Wifi'></i> Wifi</div>" if bus_service.wifi?
    str += "<div><i class='fa fa-television' aria-hidden='true' data-toggle='tooltip' data-placement='top' title='Telivision'></i> Telivision</div>" if bus_service.tv?
    str += "<div><i class='fa-solid fa-toilet' aria-hidden='true' data-toggle='tooltip' data-placement='top' title='Toilet'></i> Washroom</div>" if bus_service.washroom?
    str += "<div><i class='fa fa-snowflake-o' aria-hidden='true' data-toggle='tooltip' data-placement='top' title='Air Conditioner'></i> Air Conditioner</div>" if bus_service.ac?
    str += "<div><i class='fas fa-cheeseburger' aria-hidden='true' data-toggle='tooltip' data-placement='top' title='Foods'></i> Food</div>" if bus_service.food?
    str += "<div><i class='fa-solid fa-blanket' aria-hidden='true'  data-toggle='tooltip' data-placement='top' title='Blanket'></i> Blanket</div>" if bus_service.blanket?
    str
  end
end
