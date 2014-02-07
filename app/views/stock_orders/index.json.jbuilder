json.array!(@stock_orders) do |stock_order|
  json.extract! stock_order, :stock_id, :quantity, :unit_type_id, :company_id, :remark
  json.url stock_order_url(stock_order, format: :json)
end
