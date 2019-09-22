FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }
    attachment { "MyString" }
    feed { nil }
    user { nil }
  end
end
