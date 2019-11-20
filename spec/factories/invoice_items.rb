FactoryBot.define do
  factory :invoice_item do
    item { nil }
    invoice { nil }
    quantity { 1 }
    unit_price { "9.99" }
    created_at { "2019-11-19 16:04:19" }
    updated_at { "2019-11-19 16:04:19" }
  end
end
