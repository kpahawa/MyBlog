json.array!(@projects) do |project|
  json.extract! project, :id, :title, :summary, :url
  json.url project_url(project, format: :json)
end
