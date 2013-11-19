json.array!(@uniform_items) do |uniform_item|
  json.extract! uniform_item, :code, :name, :notes
  json.url uniform_item_url(uniform_item, format: :json)
end
