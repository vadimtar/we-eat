class Api::V1::RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :rating, :is_tenbis, :address, :maximum_delivery_time, :lng, :lat

  belongs_to :cuisine, serializer: Api::V1::CuisineSerializer
end