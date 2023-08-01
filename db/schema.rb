# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_07_11_112547) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "bookings", force: :cascade do |t|
    t.integer "schedule_id", null: false
    t.integer "bus_id", null: false
    t.string "start_location"
    t.string "end_location"
    t.string "seat_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bus_id"], name: "index_bookings_on_bus_id"
    t.index ["schedule_id"], name: "index_bookings_on_schedule_id"
  end

  create_table "bus_routes", force: :cascade do |t|
    t.string "source_city"
    t.string "destination_city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bus_services", force: :cascade do |t|
    t.integer "bus_id", null: false
    t.boolean "ac", default: false
    t.boolean "tv", default: false
    t.boolean "washroom", default: false
    t.boolean "wifi", default: false
    t.boolean "food", default: false
    t.boolean "blanket", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bus_id"], name: "index_bus_services_on_bus_id"
  end

  create_table "bus_trips", force: :cascade do |t|
    t.string "pickup_location"
    t.string "destination_location"
    t.string "distance"
    t.time "departure"
    t.integer "bus_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bus_id"], name: "index_bus_trips_on_bus_id"
  end

  create_table "buses", force: :cascade do |t|
    t.string "bus_number"
    t.string "bus_name"
    t.integer "total_seat"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drivers", force: :cascade do |t|
    t.string "name"
    t.string "license"
    t.integer "age"
    t.bigint "contact_no"
    t.integer "bus_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bus_id"], name: "index_drivers_on_bus_id"
  end

  create_table "passengers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.bigint "contact_no"
    t.text "address"
    t.integer "age"
    t.integer "booking_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_passengers_on_booking_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.date "trip_date"
    t.integer "bus_id", null: false
    t.integer "available_seat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bus_id"], name: "index_schedules_on_bus_id"
  end

  create_table "seats", force: :cascade do |t|
    t.string "name"
    t.integer "seat_type", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "bus_id", null: false
    t.index ["bus_id"], name: "index_seats_on_bus_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "full_name"
    t.string "service_state"
    t.bigint "phone_number"
    t.integer "role"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bookings", "buses"
  add_foreign_key "bookings", "schedules"
  add_foreign_key "bus_services", "buses"
  add_foreign_key "drivers", "buses"
  add_foreign_key "passengers", "bookings"
  add_foreign_key "schedules", "buses"
  add_foreign_key "seats", "buses"
end
