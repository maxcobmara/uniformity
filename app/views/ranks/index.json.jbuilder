json.array!(@ranks) do |rank|
  json.extract! rank, :shortname, :name
  json.url rank_url(rank, format: :json)
end
