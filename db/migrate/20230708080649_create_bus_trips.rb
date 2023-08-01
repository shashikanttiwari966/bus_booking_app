class CreateBusTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :bus_trips do |t|
      t.string :pickup_location
      t.string :destination_location
      t.string :distance
      t.time :departure
      t.references :bus

      t.timestamps
    end
  end
end
