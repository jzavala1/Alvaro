class ChangeClientTableName < ActiveRecord::Migration
  def change
    rename_table :clients, :suppliers
    rename_column :orders, :client_id, :supplier_id
  end
end
