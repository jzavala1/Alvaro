json.array!(@retiros) do |retiro|
  json.extract! retiro, :id, :cliente, :fecha, :hora, :estado
  json.url retiro_url(retiro, format: :json)
end
