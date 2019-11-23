FactoryBot.define do
  factory :item do
    name {Faker::Commerce.product_name}
    description {Faker::Marketing.buzzwords}
    unit_price {Faker::Number.decimal(l_digits: 2)}
    merchant
    created_at {DateTime.now.strftime('%F %T UTC')}
    updated_at {DateTime.now.strftime('%F %T UTC')}
  end
end
