json.array!(@products) do |product|
  json.extract! product, :id, :observation, :status, :category_id, :sub_category_id, :section_id, :name, :sku, :brand, :new_foreign_price, :new_chilean_price, :used_foreign_price, :used_chilean_price, :reference_price, :price, :order_id, :weight, :description
  json.url product_url(product, format: :json)
end
