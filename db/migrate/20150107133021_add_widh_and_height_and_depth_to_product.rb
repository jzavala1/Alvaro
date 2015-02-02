class AddWidhAndHeightAndDepthToProduct < ActiveRecord::Migration
  def change
    add_column :products, :width, :float
    add_column :products, :height, :float
    add_column :products, :depth, :float
    change_column :products, :weight, :float
  end
end
