json.array!(@kits) do |kit|
  json.extract! kit, :code, :combo_code, :name, :ancestry, :ancestry_depth
  json.url kit_url(kit, format: :json)
end
