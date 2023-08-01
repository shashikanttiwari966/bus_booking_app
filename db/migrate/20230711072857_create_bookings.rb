class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :schedule, null: false, foreign_key: true
      t.references :bus, null: false, foreign_key: true
      t.string :start_location
      t.string :end_location
      t.string :seat_name

      t.timestamps
    end
  end
end
