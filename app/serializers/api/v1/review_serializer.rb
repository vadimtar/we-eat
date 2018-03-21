class Api::V1::ReviewSerializer < ActiveModel::Serializer
  attributes :id, :reviewer_name, :rating, :review_comment

  belongs_to :restaurant, serializer: Api::V1::RestaurantSerializer
end