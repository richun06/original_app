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

ActiveRecord::Schema.define(version: 2022_12_12_140923) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "care_users", force: :cascade do |t|
    t.string "name"
    t.date "birthday"
    t.integer "age"
    t.integer "sex"
    t.text "image"
    t.integer "availability"
    t.integer "division"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "healths", force: :cascade do |t|
    t.string "responsibility"
    t.date "record_in_at"
    t.time "time"
    t.float "body_temperature"
    t.integer "blood_pressure_up"
    t.integer "blood_pressure_down"
    t.integer "pulse"
    t.integer "breakfast"
    t.integer "lunch"
    t.integer "snack"
    t.integer "dinner"
    t.integer "before_sleep"
    t.integer "morning_medicine"
    t.integer "daytime_medicine"
    t.integer "snack_medicine"
    t.integer "evening_medicine"
    t.integer "sleep_medicine"
    t.time "bath_time"
    t.integer "bath_division"
    t.string "caregiver"
    t.float "height"
    t.float "body_weight"
    t.text "daytime"
    t.string "daytime_staff"
    t.text "night"
    t.string "night_staff"
    t.text "contact"
    t.string "contact_staff"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
