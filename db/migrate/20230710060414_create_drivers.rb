class CreateDrivers < ActiveRecord::Migration[7.0]
  def change
    create_table :drivers do |t|
      t.string :name
      t.string :license
      t.integer :age
      t.bigint :contact_no
      t.references :bus, null: false, foreign_key: true

      t.timestamps
    end
  end
end
