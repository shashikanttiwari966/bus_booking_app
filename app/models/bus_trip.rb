class BusTrip < ApplicationRecord
  belongs_to :bus

  after_create do
    geo_coder1 = Geocoder.search(self.pickup_location)
    geo_coder2 = Geocoder.search(self.destination_location)
    distance = distance_to(geo_coder1,geo_coder2)
    # price = calculate_price(distance.to_i)
    self.update(distance: "#{distance}km")   #, price: price.to_i
  end

  private

  def calculate_price(distance)
    base_price = 10.0
    rate_per_km = 2
    price = base_price + (distance * rate_per_km)
    price.round(2)
  end

  def distance_to(geo_coder1,geo_coder2)
    earth_radius = 6378 # in kilometers

    lat1 = geo_coder1.first.data["lat"].to_f
    lon1 = geo_coder1.first.data["lon"].to_f
    lat2 = geo_coder2.first.data["lat"].to_f
    lon2 = geo_coder2.first.data["lon"].to_f

    dlat = deg2rad(lat2 - lat1)
    dlon = deg2rad(lon2 - lon1)

    a = Math.sin(dlat / 2) * Math.sin(dlat / 2) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.sin(dlon / 2) * Math.sin(dlon / 2)
    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))
    distance = earth_radius * c

    distance.round(2) # return distance rounded to two decimal places
  end

  def deg2rad(deg)
    deg * (Math::PI / 180)
  end
end
