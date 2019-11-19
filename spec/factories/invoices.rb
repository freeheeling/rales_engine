FactoryBot.define do
  factory :invoice do
    customer { nil }
    merchant { nil }
    status { "MyString" }
    created_at { "2019-11-19 12:12:35" }
    updated_at { "2019-11-19 12:12:35" }
  end
end
