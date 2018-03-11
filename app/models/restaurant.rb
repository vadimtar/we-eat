class Restaurant < ApplicationRecord
  belongs_to :cuisine
  has_many :reviews, dependent: destroy
end
