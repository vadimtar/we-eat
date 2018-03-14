FactoryBot.define do
  factory :restaurant, class: Restaurant do
    name "Schrute's Place"
    rating 3
    is_tenbis true
    address "Scranton, PN"
    maximum_delivery_time 40
    association :cuisine, factory: :cuisine
  end
end
