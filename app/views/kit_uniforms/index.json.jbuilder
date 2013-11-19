json.array!(@kit_uniforms) do |kit_uniform|
  json.extract! kit_uniform, :kit_id, :uniform_id, :quantity, :notes
  json.url kit_uniform_url(kit_uniform, format: :json)
end
