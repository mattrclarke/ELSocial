FactoryBot.define do
  factory :profile do
    first_name  { 'test' }
    last_name   { 'tester' }
    about_me    { "words here" }
    user        { nil }
    trait :with_feed do
      association :feed
    end
  end
end
