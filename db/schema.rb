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

ActiveRecord::Schema.define(version: 20180401141614) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cuisines", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "serialized_options"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.float "rating", default: 0.0
    t.boolean "is_tenbis"
    t.string "address"
    t.integer "maximum_delivery_time"
    t.bigint "cuisine_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "reviews_count"
    t.float "lng"
    t.float "lat"
    t.index ["cuisine_id"], name: "index_restaurants_on_cuisine_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "restaurant_id"
    t.string "reviewer_name"
    t.integer "rating"
    t.text "review_comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_reviews_on_restaurant_id"
  end

  add_foreign_key "restaurants", "cuisines"
  add_foreign_key "reviews", "restaurants"
end
