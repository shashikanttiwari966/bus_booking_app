class CreateBuses < ActiveRecord::Migration[7.0]
  def change
    create_table :buses do |t|
      t.string :bus_number
      t.string :bus_name
      t.integer :total_seat
      t.bigint :user_id, null: false

      t.timestamps
    end
  end
end
