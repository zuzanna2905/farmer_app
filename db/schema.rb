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

ActiveRecord::Schema.define(version: 2019_08_21_100941) do

  create_table "chemicals", force: :cascade do |t|
    t.string "name"
    t.datetime "expiration_date"
    t.float "volume"
    t.float "volume_left"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_chemicals_on_user_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.datetime "start_date"
    t.string "skills"
    t.float "payment"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_employees_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.time "time"
    t.integer "chemical_id"
    t.integer "employee_id"
    t.integer "machine_id"
    t.integer "field_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chemical_id"], name: "index_events_on_chemical_id"
    t.index ["employee_id"], name: "index_events_on_employee_id"
    t.index ["field_id"], name: "index_events_on_field_id"
    t.index ["machine_id"], name: "index_events_on_machine_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "fields", force: :cascade do |t|
    t.string "number"
    t.float "area"
    t.datetime "year"
    t.boolean "ownership"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["user_id"], name: "index_fields_on_user_id"
  end

  create_table "machines", force: :cascade do |t|
    t.string "name"
    t.datetime "year"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_machines_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "warehouses", force: :cascade do |t|
    t.string "name"
    t.float "volume"
    t.float "volume_left"
    t.string "items"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_warehouses_on_user_id"
  end

end
