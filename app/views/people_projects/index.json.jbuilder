json.array!(@people_projects) do |people_project|
  json.extract! people_project, :id, :user_id, :project_id
  json.url people_project_url(people_project, format: :json)
end
