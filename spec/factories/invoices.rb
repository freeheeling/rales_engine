FactoryBot.define do
  factory :invoice do
    customer { nil }
    merchant { nil }
    status {'shipped'}
    created_at {DateTime.now.strftime('%F %T UTC')}
    updated_at {DateTime.now.strftime('%F %T UTC')}
  end
end
