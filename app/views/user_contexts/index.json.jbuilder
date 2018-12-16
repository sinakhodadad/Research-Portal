json.array!(@user_contexts) do |user_context|
  json.extract! user_context, :id, :value, :context, :user
  json.url user_context_url(user_context, format: :json)
end
