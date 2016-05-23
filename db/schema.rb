# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160523024003) do

  create_table "repair_submissions", force: :cascade do |t|
    t.string   "email"
    t.integer  "vehicle_year"
    t.string   "vehicle_make"
    t.string   "vehicle_model"
    t.string   "vehicle_trim"
    t.string   "vehicle_mileage"
    t.string   "repair_description"
    t.string   "parts_cost"
    t.string   "labor_cost"
    t.text     "review"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "shop_id"
    t.string   "total_cost"
  end

  add_index "repair_submissions", ["shop_id"], name: "index_repair_submissions_on_shop_id"

  create_table "shops", force: :cascade do |t|
    t.string   "shop_name"
    t.string   "shop_zip"
    t.string   "shop_city"
    t.string   "shop_state_code"
    t.string   "shop_country_code"
    t.string   "shop_neighborhood"
    t.string   "shop_address"
    t.boolean  "shop_claimed",      default: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.boolean  "shop_closed",       default: false
    t.string   "shop_phone"
  end

  create_table "subscribers", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "zip"
  end

  add_index "subscribers", ["email"], name: "index_subscribers_on_email", unique: true

end
