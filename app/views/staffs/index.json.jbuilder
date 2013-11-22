json.array!(@staffs) do |staff|
  json.extract! staff, :id_no, :rank_id, :name
  json.url staff_url(staff, format: :json)
end
