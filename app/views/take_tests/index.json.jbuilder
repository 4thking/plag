json.array!(@take_tests) do |take_test|
  json.extract! take_test, :id
  json.url take_test_url(take_test, format: :json)
end
