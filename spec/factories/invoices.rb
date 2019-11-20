FactoryBot.define do
  factory :invoice do
    customer { nil }
    merchant { nil }
    status { "MyString" }
    created_at { "2019-11-19 16:04:19" }
    updated_at { "2019-11-19 16:04:19" }
  end
end
