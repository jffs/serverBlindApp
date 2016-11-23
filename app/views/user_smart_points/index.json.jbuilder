json.array!(@user_smart_points) do |user_smart_point|
  json.extract! user_smart_point, :id, :user_mac, :spoint_mac, :date
  json.url user_smart_point_url(user_smart_point, format: :json)
end
