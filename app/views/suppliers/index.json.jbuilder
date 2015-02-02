json.array!(@suppliers) do |supplier|
  json.extract! supplier, :id, :first_name, :last_name, :rut, :email, :phone, :address, :zone, :state
  json.url supplier_url(supplier, format: :json)
end
