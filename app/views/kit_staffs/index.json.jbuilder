json.array!(@kit_staffs) do |kit_staff|
  json.extract! kit_staff, :kit_id, :staff_id, :staff_group_id
  json.url kit_staff_url(kit_staff, format: :json)
end
