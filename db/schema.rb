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

ActiveRecord::Schema.define(version: 20180120212837) do

  create_table "transfers", force: :cascade do |t|
    t.string   "account_number_from", null: false
    t.string   "account_number_to",   null: false
    t.integer  "amount_pennies",      null: false
    t.string   "country_code_from",   null: false
    t.string   "country_code_to",     null: false
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_transfers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",      limit: 20, null: false
    t.string   "last_name",       limit: 20, null: false
    t.string   "address_line_1",  limit: 50, null: false
    t.date     "dob",                        null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
  end

end
