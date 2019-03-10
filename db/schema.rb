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

ActiveRecord::Schema.define(version: 2019_03_10_151107) do

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "callback_url"
    t.string "email"
    t.string "secret_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drivers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "vbucks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requestable", force: :cascade do |t|
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "drivers_id"
    t.integer "clients_id"
    t.index ["clients_id"], name: "index_requestable_on_clients_id"
    t.index ["drivers_id"], name: "index_requestable_on_drivers_id"
  end

  create_table "sorting_requests", force: :cascade do |t|
    t.json "unsorted_list"
    t.json "sorted_list"
    t.json "options"
    t.integer "requestable_id"
    t.index ["requestable_id"], name: "index_sorting_requests_on_requestable_id"
  end

end
