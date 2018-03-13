json.extract! review, :id, :restaurant_id, :reviewer_name, :rating, :review_comment, :created_at, :updated_at
json.url review_url(review, format: :json)
