class Review < ApplicationRecord
  belongs_to :restaurant, counter_cache: true
  validates :restaurant_id,
            :reviewer_name,
            :rating,
            presence: true
  after_create :update_restaurant_rating_after_create
  after_destroy :update_restaurant_rating_after_destroy

  def update_restaurant_rating_after_create
    restaurant.update_rating_after_review_add(rating)
  end

  def update_restaurant_rating_after_destroy
    restaurant.update_rating_after_review_delete(rating)
  end
end
