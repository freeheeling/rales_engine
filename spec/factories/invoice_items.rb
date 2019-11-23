FactoryBot.define do
  factory :invoice_item do
    item
    invoice
    quantity {Faker::Number.within(range: 1..10)}
    unit_price {Faker::Number.decimal(l_digits: 2)}
    created_at {DateTime.now.strftime('%F %T UTC')}
    updated_at {DateTime.now.strftime('%F %T UTC')}
  end
end
