FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    trait :with_profile do
      association :profile, :with_feed
    end
  end
end
