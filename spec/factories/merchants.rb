FactoryBot.define do
  factory :merchant do
    name {Faker::Company.name}
    created_at {DateTime.now.strftime('%F %T UTC')}
    updated_at {DateTime.now.strftime('%F %T UTC')}
  end
end
