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

  it 'returns show record by id' do
    id = create(:customer).id

    get "/api/v1/customers/#{id}"

    customer = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(customer[:data][:id].to_i).to eq(id)
  end

  it 'finds record based on customer id query' do

    get "/api/v1/customers/find?id=#{@customer.id}"

    customer = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(customer[:data][:id].to_i).to eq(@customer.id)
  end

  it 'finds record based on customer first_name param' do
    get "/api/v1/customers/find?first_name=#{@customer.first_name}"

    customer = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(customer[:data][:attributes][:first_name]).to eq(@customer.first_name)
  end

  it 'finds record based on customer last_name param' do
    get "/api/v1/customers/find?last_name=#{@customer.last_name}"

    customer = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(customer[:data][:attributes][:last_name]).to eq(@customer.last_name)
  end

  it 'finds record based on creation timestamp' do
    get "/api/v1/customers/find?created_at=#{@customer.created_at}"

    customer = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(customer[:data][:id].to_i).to eq(@customer.id)
  end

  it 'finds record based on update timestamp' do
    get "/api/v1/customers/find?updated_at=#{@customer.updated_at}"

    customer = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(customer[:data][:id].to_i).to eq(@customer.id)
  end
end
