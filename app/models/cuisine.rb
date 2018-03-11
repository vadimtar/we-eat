class Cuisine < ApplicationRecord
  has_many :restaurants
  before_destroy :ensure_not_refferred_by_any_restaurant

  def ensure_not_referred_by_any_restaurant

  end
end
