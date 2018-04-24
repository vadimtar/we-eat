class Restaurant < ApplicationRecord
  belongs_to :cuisine
  has_many :reviews, dependent: :destroy
  validates :name,
            :cuisine_id,
            # :is_tenbis,
            :address,
            :maximum_delivery_time,
            presence: true
  # validates :is_tenbis, inclusion: [true, false]
  validates :maximum_delivery_time, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def update_rating_after_review_add(rating)
    sum = (self.reviews_count - 1) * self.rating
    self.rating = ((sum + rating) / self.reviews_count)
    save!
  end

  def update_rating_after_review_delete(rating)
    sum = (self.reviews_count + 1) * self.rating
    self.rating = ((sum - rating) / self.reviews_count)
    save!
  end

end

