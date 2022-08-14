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

ActiveRecord::Schema.define(version: 2022_08_14_160833) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "add_ons", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "restaurant_id"
    t.index ["restaurant_id"], name: "index_categories_on_restaurant_id"
  end

  create_table "deal_details", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "deal_id"
    t.bigint "deal_menu_item_id"
    t.index ["deal_id"], name: "index_deal_details_on_deal_id"
    t.index ["deal_menu_item_id"], name: "index_deal_details_on_deal_menu_item_id"
  end

  create_table "deal_menu_items", force: :cascade do |t|
    t.string "name"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "deals", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "restaurant_id"
    t.integer "price"
    t.index ["restaurant_id"], name: "index_deals_on_restaurant_id"
  end

  create_table "discounts", force: :cascade do |t|
    t.string "name"
    t.float "offPercent"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "restaurant_id"
    t.index ["restaurant_id"], name: "index_discounts_on_restaurant_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "cnic"
    t.string "address"
    t.integer "salary"
    t.string "contact"
    t.bigint "manager_id"
    t.bigint "restaurant_id"
    t.index ["email"], name: "index_employees_on_email", unique: true
    t.index ["manager_id"], name: "index_employees_on_manager_id"
    t.index ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true
    t.index ["restaurant_id"], name: "index_employees_on_restaurant_id"
  end

  create_table "menu_item_add_ons", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "menu_items_id"
    t.bigint "add_ons_id"
    t.index ["add_ons_id"], name: "index_menu_item_add_ons_on_add_ons_id"
    t.index ["menu_items_id"], name: "index_menu_item_add_ons_on_menu_items_id"
  end

  create_table "menu_items", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "category_id"
    t.index ["category_id"], name: "index_menu_items_on_category_id"
  end

  create_table "options", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "menu_item_id"
    t.index ["menu_item_id"], name: "index_options_on_menu_item_id"
  end

  create_table "promos", force: :cascade do |t|
    t.string "code"
    t.float "offPercent"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "menu_item_id"
    t.index ["menu_item_id"], name: "index_promos_on_menu_item_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "owner"
    t.decimal "perCut"
    t.time "openingHours"
    t.time "closingHours"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "manager_id"
    t.index ["manager_id"], name: "index_restaurants_on_manager_id"
  end

end
