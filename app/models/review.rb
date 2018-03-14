class Review < ApplicationRecord
  belongs_to :restaurant, counter_cache: true
  validates :restaurant_id,
            :reviewer_name,
            :rating,
            presence: true
end
