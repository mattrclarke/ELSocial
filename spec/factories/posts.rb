FactoryBot.define do
  factory :post do
    title { "MyString" }
    content { "MyString" }
    attachment { "MyString" }
    profile { nil }
    feed { nil }
  end
end
