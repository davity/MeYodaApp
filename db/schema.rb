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

ActiveRecord::Schema.define(version: 20131030113526) do

  create_table "accounts", force: true do |t|
    t.string   "number"
    t.float    "balance"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accounts", ["user_id"], name: "index_accounts_on_user_id"

  create_table "bids", force: true do |t|
    t.float    "value"
    t.integer  "card_type_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bids", ["card_type_id"], name: "index_bids_on_card_type_id"
  add_index "bids", ["user_id"], name: "index_bids_on_user_id"

  create_table "card_types", force: true do |t|
    t.string   "name"
    t.string   "edition"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_dir"
  end

  create_table "cards", force: true do |t|
    t.integer  "card_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "cards", ["card_type_id"], name: "index_cards_on_card_type_id"
  add_index "cards", ["user_id"], name: "index_cards_on_user_id"

  create_table "sales", force: true do |t|
    t.float    "starting_price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "card_id"
  end

  add_index "sales", ["card_id"], name: "index_sales_on_card_id"

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
