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

ActiveRecord::Schema.define(version: 2021_07_19_150028) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "zipcode"
    t.string "address"
    t.string "complement"
    t.string "neighborhood"
    t.string "city"
    t.string "state"
    t.integer "ibge_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "citizen_id"
    t.integer "residencial_number"
    t.index ["citizen_id"], name: "index_addresses_on_citizen_id"
  end

  create_table "citizens", force: :cascade do |t|
    t.string "name"
    t.string "cpf"
    t.string "cns"
    t.date "birth_date"
    t.string "phonenumber"
    t.string "photo"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.integer "country_code", default: 55
  end

end
