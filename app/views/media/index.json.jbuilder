json.array!(@media) do |medium|
  json.extract! medium, :id, :m
  json.url medium_url(medium, format: :json)
end
