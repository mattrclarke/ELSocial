FactoryBot.define do
  factory :profile do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    user { nil }
    trait :with_feed do
      association :feed
    end
  end
end
