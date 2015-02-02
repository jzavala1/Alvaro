class AddCondignationToProducts < ActiveRecord::Migration
  def change
    add_column :products, :is_consignation, :boolean, default: false
    add_column :products, :publicated_at, :date
    add_column :products, :percentage_consignation, :integer

    Product.all.each do |product|
      product.is_consignation = true
      product.save
    end
  end
end
