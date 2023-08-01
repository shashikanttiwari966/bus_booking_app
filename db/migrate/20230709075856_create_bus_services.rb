class CreateBusServices < ActiveRecord::Migration[7.0]
  def change
    create_table :bus_services do |t|
      t.references :bus, null: false, foreign_key: true
      t.boolean :ac, default: false
      t.boolean :tv, default: false
      t.boolean :washroom, default: false
      t.boolean :wifi, default: false
      t.boolean :food, default: false
      t.boolean :blanket, default: false

      t.timestamps
    end
  end
end
