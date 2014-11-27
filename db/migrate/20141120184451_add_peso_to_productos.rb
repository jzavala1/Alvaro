class AddPesoToProductos < ActiveRecord::Migration
  def change
    add_column :productos, :peso, :decimal
  end
end
