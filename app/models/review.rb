class Review < ApplicationRecord
  belongs_to :restaurant
  validates :restaurant_id,
            :reviewer_name,
            :rating,
            presence: true
end
