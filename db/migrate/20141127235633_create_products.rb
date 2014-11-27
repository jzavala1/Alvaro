class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.text :observation
      t.string :status
      t.references :category, index: true
      t.references :sub_category, index: true
      t.references :section, index: true
      t.text :name
      t.string :sku
      t.string :brand
      t.integer :new_foreign_price
      t.integer :new_chilean_price
      t.integer :used_foreign_price
      t.integer :used_chilean_price
      t.integer :reference_price
      t.integer :price
      t.references :order, index: true
      t.decimal :weight
      t.text :description

      t.timestamps
    end
  end
end
