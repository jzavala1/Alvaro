class RemoveProductoFromVenta < ActiveRecord::Migration
  def change
    remove_index :venta, :producto
    remove_column :venta, :producto, :string
  end
end
