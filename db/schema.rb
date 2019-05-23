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

ActiveRecord::Schema.define(version: 2019_05_23_114152) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "basket_items", force: :cascade do |t|
    t.bigint "basket_id"
    t.bigint "shirt_id"
    t.integer "price_cents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["basket_id"], name: "index_basket_items_on_basket_id"
    t.index ["shirt_id"], name: "index_basket_items_on_shirt_id"
  end

  create_table "baskets", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_baskets_on_user_id"
  end

  create_table "fabrics", force: :cascade do |t|
    t.string "name"
    t.integer "weight"
    t.string "mill"
    t.string "origin"
    t.string "color"
    t.string "fabric_type"
    t.text "about"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shirt_fabrics", force: :cascade do |t|
    t.bigint "shirt_id"
    t.bigint "fabric_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fabric_id"], name: "index_shirt_fabrics_on_fabric_id"
    t.index ["shirt_id"], name: "index_shirt_fabrics_on_shirt_id"
  end

  create_table "shirts", force: :cascade do |t|
    t.string "name"
    t.string "collar"
    t.string "cuff"
    t.string "placket"
    t.string "pocket"
    t.string "contrast_collar"
    t.text "about"
    t.integer "price_cents"
    t.string "sku"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "date_of_birth"
    t.string "phone"
    t.string "occupation"
    t.integer "height"
    t.integer "weight"
    t.integer "shoe_size"
    t.string "chest"
    t.string "stomach"
    t.string "arms"
    t.string "seat"
    t.string "thigh"
    t.text "body_description"
    t.string "preferred_fit"
    t.string "dominant_hand"
    t.integer "jacket_size"
    t.integer "trouser_waist_size"
    t.integer "shirt_collar_size"
    t.text "shirt_notes"
    t.text "jacket_notes"
    t.text "trouser_notes"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "basket_items", "baskets"
  add_foreign_key "basket_items", "shirts"
  add_foreign_key "baskets", "users"
  add_foreign_key "shirt_fabrics", "fabrics"
  add_foreign_key "shirt_fabrics", "shirts"
end
