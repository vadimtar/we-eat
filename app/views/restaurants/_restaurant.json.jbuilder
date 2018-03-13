json.extract! restaurant, :id, :name, :rating, :is_tenbis, :address, :maximum_delivery_time, :cuisine_id, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)
