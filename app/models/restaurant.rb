class Restaurant < ApplicationRecord
  belongs_to :cuisine
  has_many :reviews, dependent: :destroy
  validates :name,
            :cuisine_id,
            :is_tenbis,
            :address,
            :maximum_delivery_time,
            presence: true
end

