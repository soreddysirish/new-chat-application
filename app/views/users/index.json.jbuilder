json.array!(@users) do |user|
  json.extract! user, :id, :index
  json.url user_url(user, format: :json)
end
