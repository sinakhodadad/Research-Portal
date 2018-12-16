json.array!(@projects) do |project|
  json.extract! project, :id, :title, :goal, :start_date, :end_time, :sponsor_id
  json.url project_url(project, format: :json)
end
