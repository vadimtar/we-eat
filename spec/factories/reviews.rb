FactoryBot.define do
  factory :review, class: Review do
    reviewer_name { Faker::Name.name }
    rating 3
    review_comment Faker::ChuckNorris.fact

    association :restaurant, factory: :restaurant
  end
end
