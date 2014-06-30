json.array!(@contracts) do |contract|
  json.extract! contract, :contract_no, :name, :description, :company_id, :value, :starts_on, :ends_on, :issued_by, :contract_type
  json.url contract_url(contract, format: :json)
end
