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

ActiveRecord::Schema.define(version: 20141127235633) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "rut"
    t.string   "email"
    t.string   "phone"
    t.string   "address"
    t.string   "zone"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.datetime "date"
    t.string   "status"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["client_id"], name: "index_orders_on_client_id"

  create_table "products", force: true do |t|
    t.text     "observation"
    t.string   "status"
    t.integer  "category_id"
    t.integer  "sub_category_id"
    t.integer  "section_id"
    t.text     "name"
    t.string   "sku"
    t.string   "brand"
    t.integer  "new_foreign_price"
    t.integer  "new_chilean_price"
    t.integer  "used_foreign_price"
    t.integer  "used_chilean_price"
    t.integer  "reference_price"
    t.integer  "price"
    t.integer  "order_id"
    t.decimal  "weight"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id"
  add_index "products", ["order_id"], name: "index_products_on_order_id"
  add_index "products", ["section_id"], name: "index_products_on_section_id"
  add_index "products", ["sub_category_id"], name: "index_products_on_sub_category_id"

  create_table "sections", force: true do |t|
    t.string   "name"
    t.integer  "sub_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sections", ["sub_category_id"], name: "index_sections_on_sub_category_id"

  create_table "sub_categories", force: true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sub_categories", ["category_id"], name: "index_sub_categories_on_category_id"

end
