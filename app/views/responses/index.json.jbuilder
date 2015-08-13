json.array!(@responses) do |response|
  json.extract! response, :id, :user_id, :answer_id
  json.url response_url(response, format: :json)
end
