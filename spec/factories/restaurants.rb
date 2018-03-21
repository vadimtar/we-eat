FactoryBot.define do
  factory :restaurant, class: Restaurant do
    name Faker::Name.name
    rating Random.rand(1..3)
    is_tenbis true
    address Faker::Address.street_name
    maximum_delivery_time Random.rand(30..120)
    association :cuisine, factory: :cuisine
  end
end
