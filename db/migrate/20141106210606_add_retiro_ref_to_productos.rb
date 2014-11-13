class AddRetiroRefToProductos < ActiveRecord::Migration
  def change
    add_reference :productos, :retiro, index: true
  end
end
