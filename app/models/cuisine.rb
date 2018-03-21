class Cuisine < ApplicationRecord
  validates :name, presence: true
  has_many :restaurants
  before_destroy :ensure_not_refferred_by_any_restaurant

  def ensure_not_refferred_by_any_restaurant
    true
  end
end
