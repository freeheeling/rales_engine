FactoryBot.define do
  factory :transaction do
    invoice { nil }
    credit_card_number {Faker::Number.number(digits: 16)}
    result { "MyString" }
    created_at {DateTime.now.strftime('%F %T UTC')}
    updated_at {DateTime.now.strftime('%F %T UTC')}
  end
end
