FactoryBot.define do
  factory :comment do
    content { "MyString" }
    profile { nil }
    user { nil }
  end
end
