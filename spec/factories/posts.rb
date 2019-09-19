FactoryBot.define do
  factory :post do
    title { "MyString" }
    content { "MyString" }
    attachment { "MyString" }
    feed { nil }
    user { nil }
  end
end
