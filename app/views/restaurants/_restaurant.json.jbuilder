json.extract! restaurant, :id, :name, :cousine_id, :rating, :is_tenbis, :address, :maximum_delivery_time, :cuisine_id, :review, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)
