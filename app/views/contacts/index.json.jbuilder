json.array!(@contacts) do |contact|
  json.extract! contact, :id, :first, :last, :email, :subscribed, :message
  json.url contact_url(contact, format: :json)
end
