FactoryBot.define do
  factory :item do
    name { "MyString" }
    description { "MyText" }
    unit_price { "9.99" }
    merchant { nil }
    created_at { "2019-11-19 16:04:19" }
    updated_at { "2019-11-19 16:04:19" }
  end
end
