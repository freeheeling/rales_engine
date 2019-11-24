FactoryBot.define do
  factory :invoice do
    customer
    merchant
    status {'shipped'}
    created_at {DateTime.now.strftime('%F %T UTC')}
    updated_at {DateTime.now.strftime('%F %T UTC')}
  end
end
