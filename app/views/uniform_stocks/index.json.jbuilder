json.array!(@uniform_stocks) do |uniform_stock|
  json.extract! uniform_stock, :uniform_id, :size, :category, :max_quantity, :min_quantity, :unit_type_id
  json.url uniform_stock_url(uniform_stock, format: :json)
end
