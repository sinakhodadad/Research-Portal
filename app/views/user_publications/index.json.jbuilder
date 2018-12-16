json.array!(@user_publications) do |user_publication|
  json.extract! user_publication, :id, :user_id, :publication_id
  json.url user_publication_url(user_publication, format: :json)
end
