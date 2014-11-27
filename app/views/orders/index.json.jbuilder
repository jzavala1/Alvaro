json.array!(@orders) do |order|
  json.extract! order, :id, :date, :status, :client_id
  json.url order_url(order, format: :json)
end
