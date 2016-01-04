json.array!(@groupmessages) do |groupmessage|
  json.extract! groupmessage, :id, :text, :user_id
  json.url groupmessage_url(groupmessage, format: :json)
end
