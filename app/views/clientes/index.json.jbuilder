json.array!(@clientes) do |cliente|
  json.extract! cliente, :id, :nombre, :apellido, :rut, :email, :telefono, :direccion, :comuna, :estado
  json.url cliente_url(cliente, format: :json)
end
