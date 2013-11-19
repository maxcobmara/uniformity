json.array!(@uniform_stock_issues) do |uniform_stock_issue|
  json.extract! uniform_stock_issue, :stock_id, :issued_to, :issued_by, :issued_on, :quantity, :document_id
  json.url uniform_stock_issue_url(uniform_stock_issue, format: :json)
end
