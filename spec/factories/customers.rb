FactoryBot.define do
  factory :customer do
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    created_at {DateTime.now.strftime('%F %T UTC')}
    updated_at {DateTime.now.strftime('%F %T UTC')}
  end
end
