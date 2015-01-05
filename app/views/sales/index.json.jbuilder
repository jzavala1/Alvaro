json.array!(@sales) do |sale|
  json.extract! sale, :id, :channel, :amount, :client_id, :shipping_id
  json.url sale_url(sale, format: :json)
end
