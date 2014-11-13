json.array!(@productos) do |producto|
  json.extract! producto, :id, :observaciones, :proceso, :categoria, :subcategoria, :seccion, :nombre, :sku, :descripcion, :marca, :estado, :precio_nuevo_externo, :precio_nuevo_chile, :precio_usado_externo, :precio_usado_chile, :precio_referencia, :precio
  json.url producto_url(producto, format: :json)
end
