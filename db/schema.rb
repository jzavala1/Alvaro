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

ActiveRecord::Schema.define(version: 20141106210606) do

  create_table "clientes", force: true do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.string   "rut"
    t.string   "email"
    t.integer  "telefono"
    t.string   "direccion"
    t.string   "comuna"
    t.string   "estado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "productos", force: true do |t|
    t.text     "observaciones"
    t.string   "proceso"
    t.string   "categoria"
    t.string   "subcategoria"
    t.string   "seccion"
    t.text     "nombre"
    t.string   "sku"
    t.text     "descripcion"
    t.string   "marca"
    t.string   "estado"
    t.integer  "precio_nuevo_externo"
    t.integer  "precio_nuevo_chile"
    t.integer  "precio_usado_externo"
    t.integer  "precio_usado_chile"
    t.integer  "precio_referencia"
    t.integer  "precio"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "retiro_id"
  end

  add_index "productos", ["retiro_id"], name: "index_productos_on_retiro_id"

  create_table "retiros", force: true do |t|
    t.date     "fecha"
    t.time     "hora"
    t.string   "estado"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cliente_id"
  end

  add_index "retiros", ["cliente_id"], name: "index_retiros_on_cliente_id"

end
