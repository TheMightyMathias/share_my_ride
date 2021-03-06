# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_12_12_154444) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "airports", force: :cascade do |t|
    t.string "city"
    t.string "name"
    t.string "iata_code"
    t.float "longitude"
    t.float "latitude"
    t.integer "elev"
    t.integer "runway_length"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "time_zone"
  end

  create_table "messages", force: :cascade do |t|
    t.string "body"
    t.bigint "user_id"
    t.bigint "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_messages_on_trip_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "rating"
    t.integer "reviewer_id"
    t.integer "reviewed_id"
    t.bigint "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_reviews_on_trip_id"
  end

  create_table "ridemates", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "destination"
    t.float "latitude"
    t.float "longitude"
    t.index ["trip_id"], name: "index_ridemates_on_trip_id"
    t.index ["user_id"], name: "index_ridemates_on_user_id"
  end

  create_table "trips", force: :cascade do |t|
    t.string "terminal"
    t.string "destination"
    t.float "latitude"
    t.float "longitude"
    t.datetime "time"
    t.bigint "user_id"
    t.integer "ride_mates_limit", default: 3
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "airport_id"
    t.float "estimate"
    t.index ["user_id"], name: "index_trips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "photo"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "messages", "trips"
  add_foreign_key "messages", "users"
  add_foreign_key "reviews", "trips"
  add_foreign_key "ridemates", "trips"
  add_foreign_key "ridemates", "users"
  add_foreign_key "trips", "users"
end
