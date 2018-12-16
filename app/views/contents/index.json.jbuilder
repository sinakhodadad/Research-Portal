json.array!(@contents) do |content|
  json.extract! content, :id, :userid, :post
  json.url content_url(content, format: :json)
end
