json.array!(@shippings) do |shipping|
  json.extract! shipping, :id, :status, :address, :payment, :cost
  json.url shipping_url(shipping, format: :json)
end
