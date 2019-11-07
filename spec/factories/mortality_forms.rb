FactoryBot.define do
  factory :mortality_form do
    date { "2019-11-07 19:55:18" }
    bird_strikes { 1 }
    seal_strikes { 1 }
    skinny { 1 }
    deformities { 1 }
    unknown { 1 }
    mort_comments { "MyText" }
    shallow_rot { 1 }
    deep_rot { 1 }
    missing_weights { 1 }
    skin_burn { "MyString" }
    fish_rub { 1 }
    probe_cleaned { 1 }
    observations { "MyText" }
    pen { nil }
    lease { nil }
  end
end
