class CreateSeats < ActiveRecord::Migration[7.0]
  def change
    create_table :seats do |t|
      t.string :name
      t.integer :seat_type, default: 0

      t.timestamps
    end
  end
end
