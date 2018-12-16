json.array!(@publications) do |publication|
  json.extract! publication, :id, :title, :year, :page, :volume, :journal_id
  json.url publication_url(publication, format: :json)
end
