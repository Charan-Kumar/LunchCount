json.array!(@food_counts) do |food_count|
  json.extract! food_count, :id, :user_id, :date, :selection
  json.url food_count_url(food_count, format: :json)
end
