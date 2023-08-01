class CreateBusRoutes < ActiveRecord::Migration[7.0]
  def change
    create_table :bus_routes do |t|
      t.string :source_city
      t.string :destination_city

      t.timestamps
    end
  end
end
