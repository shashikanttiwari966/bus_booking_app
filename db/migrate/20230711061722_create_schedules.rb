class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.date :trip_date
      t.references :bus, null: false, foreign_key: true
      t.integer :available_seat

      t.timestamps
    end
  end
end
