class AddBrandRefToProducts < ActiveRecord::Migration
  def change
    remove_column :products, :brand
    add_reference :products, :brand, index: true
  end
end
