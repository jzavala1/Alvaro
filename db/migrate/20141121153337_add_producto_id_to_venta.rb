class AddProductoIdToVenta < ActiveRecord::Migration
  def change
    add_column :venta, :producto_id, :integer
    add_index :venta, :producto_id
  end
end
