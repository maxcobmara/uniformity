json.array!(@uniform_stock_receiveds) do |uniform_stock_received|
  json.extract! uniform_stock_received, :stock_id, :quantity, :size, :received_on, :received_by, :contract_id
  json.url uniform_stock_received_url(uniform_stock_received, format: :json)
end
