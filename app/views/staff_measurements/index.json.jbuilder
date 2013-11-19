json.array!(@staff_measurements) do |staff_measurement|
  json.extract! staff_measurement, :staff_id, :uniform_id, :measurement_type, :value, :unit_type_id
  json.url staff_measurement_url(staff_measurement, format: :json)
end
