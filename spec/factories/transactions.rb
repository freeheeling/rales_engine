FactoryBot.define do
  factory :transaction do
    invoice { nil }
    credit_card_number { "MyString" }
    result { "MyString" }
    created_at { "2019-11-19 16:04:19" }
    updated_at { "2019-11-19 16:04:19" }
  end
end
