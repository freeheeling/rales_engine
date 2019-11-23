require 'rails_helper'

RSpec.describe 'Customer API record endpoints' do
  before :each do
    create_list(:customer, 3)

    @customer = create(
      :customer,
      first_name: 'Delta',
      last_name: 'Boehm',
      created_at: '2012-03-27 14:53:59',
      updated_at: '2012-03-27 14:53:59'
    )
  end

  it 'returns index of customer records' do
    get '/api/v1/customers'

    customers = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(customers[:data].length).to eq(4)
  end
end
