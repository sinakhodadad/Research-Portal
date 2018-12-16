json.array!(@contexts) do |context|
  json.extract! context, :id, :name, :type, :location, :role
  json.url context_url(context, format: :json)
end
