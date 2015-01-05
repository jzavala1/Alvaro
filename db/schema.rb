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

ActiveRecord::Schema.define(version: 20150105234102) do

  create_table "brands", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.datetime "date"
    t.string   "status"
    t.integer  "supplier_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["supplier_id"], name: "index_orders_on_supplier_id"

  create_table "products", force: true do |t|
    t.text     "observation"
    t.string   "status"
    t.integer  "category_id"
    t.integer  "sub_category_id"
    t.integer  "section_id"
    t.text     "name"
    t.string   "sku"
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
    t.integer  "brand_id"
    t.integer  "sale_id"
  end

  add_index "products", ["brand_id"], name: "index_products_on_brand_id"
  add_index "products", ["category_id"], name: "index_products_on_category_id"
  add_index "products", ["order_id"], name: "index_products_on_order_id"
  add_index "products", ["sale_id"], name: "index_products_on_sale_id"
  add_index "products", ["section_id"], name: "index_products_on_section_id"
  add_index "products", ["sub_category_id"], name: "index_products_on_sub_category_id"

  create_table "sales", force: true do |t|
    t.string   "channel"
    t.integer  "amount"
    t.date     "payment_date"
    t.integer  "client_id"
    t.integer  "shipping_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sales", ["client_id"], name: "index_sales_on_client_id"
  add_index "sales", ["shipping_id"], name: "index_sales_on_shipping_id"

  create_table "sections", force: true do |t|
    t.string   "name"
    t.integer  "sub_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sections", ["sub_category_id"], name: "index_sections_on_sub_category_id"

  create_table "shippings", force: true do |t|
    t.string   "status"
    t.string   "address"
    t.string   "payment"
    t.integer  "cost"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sub_categories", force: true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sub_categories", ["category_id"], name: "index_sub_categories_on_category_id"

  create_table "suppliers", force: true do |t|
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

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
