class ChangeAttRetiro < ActiveRecord::Migration
  create_table "retiros", force: true do |t|
    t.string   "cliente"
    t.date     "fecha"
    t.time     "hora"
    t.string   "estado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end
end
