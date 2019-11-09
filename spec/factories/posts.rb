FactoryBot.define do
  factory :post do
    title { 'sentence' }
    content { 'paragraph'}
    attachment { "MyString" }
    feed { nil }
    user { nil }
  end
end
