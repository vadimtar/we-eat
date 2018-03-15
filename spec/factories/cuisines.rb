FactoryBot.define do
  factory :cuisine, class: Cuisine do
    name Faker::Name.name
  end
end
