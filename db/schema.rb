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

ActiveRecord::Schema.define(version: 2022_12_26_104330) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "care_users", force: :cascade do |t|
    t.string "name"
    t.date "birthday"
    t.integer "age"
    t.integer "sex"
    t.text "image"
    t.integer "availability"
    t.string "division"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.text "food"
    t.text "allergy"
    t.text "sick"
    t.text "note"
    t.index ["user_id"], name: "index_care_users_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "health_id", null: false
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["health_id"], name: "index_comments_on_health_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "healths", force: :cascade do |t|
    t.string "responsibility"
    t.date "record_in_at"
    t.time "time"
    t.float "body_temperature"
    t.integer "blood_pressure_up"
    t.integer "blood_pressure_down"
    t.integer "pulse"
    t.string "breakfast"
    t.string "lunch"
    t.string "snack"
    t.string "dinner"
    t.string "before_sleep"
    t.string "morning_medicine"
    t.string "daytime_medicine"
    t.string "snack_medicine"
    t.string "evening_medicine"
    t.string "sleep_medicine"
    t.time "bath_time"
    t.string "bath_division"
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
    t.bigint "care_user_id"
    t.text "transfer"
    t.index ["care_user_id"], name: "index_healths_on_care_user_id"
  end

  create_table "managers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_managers_on_user_id"
  end

  create_table "reserves", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "start_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_reserves_on_user_id"
  end

  create_table "supervises", force: :cascade do |t|
    t.bigint "health_id"
    t.bigint "manager_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["health_id"], name: "index_supervises_on_health_id"
    t.index ["manager_id"], name: "index_supervises_on_manager_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.boolean "admin"
    t.string "phone_number"
    t.integer "postcode"
    t.integer "prefecture_code"
    t.string "address_city"
    t.string "address_street"
    t.string "address_building"
    t.integer "owner_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "care_users", "users"
  add_foreign_key "comments", "healths"
  add_foreign_key "comments", "users"
  add_foreign_key "healths", "care_users"
  add_foreign_key "managers", "users"
  add_foreign_key "reserves", "users"
  add_foreign_key "supervises", "healths"
  add_foreign_key "supervises", "managers"
end
