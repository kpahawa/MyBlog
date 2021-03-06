json.array!(@pictures) do |picture|
  json.extract! picture, :id, :title, :description, :url, :datetime
  json.url picture_url(picture, format: :json)
end
