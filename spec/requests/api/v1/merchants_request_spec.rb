require 'rails_helper'

RSpec.describe 'Merchant API endpoints' do
  before :each do
    create_list(:merchant, 3)

    @merchant = create(
      :merchant,
      name: 'Top Shop',
      created_at: '2012-03-27 14:53:59',
      updated_at: '2012-03-27 14:53:59'
    )
  end

  it 'returns index of merchant records' do
    get '/api/v1/merchants'

    merchants = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(merchants[:data].length).to eq(4)
  end

  it 'returns show record by id' do
    id = create(:merchant).id

    get "/api/v1/merchants/#{id}"

    merchant = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(merchant[:data][:id].to_i).to eq(id)
  end

  it 'finds record based on merchant id param' do
    get "/api/v1/merchants/find?id=#{@merchant.id}"

    merchant = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(merchant[:data][:id].to_i).to eq(@merchant.id)
  end

  it 'finds record based on merchant name param' do
    get "/api/v1/merchants/find?name=#{@merchant.name}"

    merchant = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(merchant[:data][:attributes][:name]).to eq(@merchant.name)
  end

  it 'finds record based on creation timestamp' do
    get "/api/v1/merchants/find?created_at=#{@merchant.created_at}"

    merchant = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(merchant[:data][:id].to_i).to eq(@merchant.id)
  end

  it 'finds record based on update timestamp' do
    get "/api/v1/merchants/find?updated_at=#{@merchant.updated_at}"

    merchant = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(merchant[:data][:id].to_i).to eq(@merchant.id)
  end

  it 'finds all records based on merchant id param' do
    get "/api/v1/merchants/find_all?id=#{@merchant.id}"

    merchants = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(merchants[:data].length).to eq(1)
    expect(merchants[:data][0][:id].to_i).to eq(@merchant.id)
  end

  it 'finds all records based on merchant name param' do
    merchant2 = create(:merchant, name: 'Top Shop')

    get "/api/v1/merchants/find_all?name=#{@merchant.name}"

    merchants = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(merchants[:data].length).to eq(2)
    expect(merchants[:data][0][:attributes][:name]).to eq(@merchant.name)
  end

  it 'finds all records based on creation timestamp' do
    merchant2 = create(:merchant, created_at: '2012-03-27 14:53:59')

    get "/api/v1/merchants/find_all?created_at=#{@merchant.created_at}"

    merchants = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(merchants[:data].length).to eq(2)
    expect(merchants[:data][0][:id].to_i).to eq(@merchant.id)
  end

  it 'finds all records based on update timestamp' do
    merchant2 = create(:merchant, updated_at: '2012-03-27 14:53:59')

    get "/api/v1/merchants/find_all?updated_at=#{@merchant.updated_at}"

    merchants = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(merchants[:data].length).to eq(2)
    expect(merchants[:data][0][:id].to_i).to eq(@merchant.id)
  end

  it 'returns a random merchant' do
    get '/api/v1/merchants/random'

    merchant = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(merchant[:data]).to be_instance_of Hash
    expect(merchant[:data][:type]).to eq('merchant')
  end
end
