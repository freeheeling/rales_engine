require 'rails_helper'

RSpec.describe 'Merchant API endpoints' do
  it 'returns index of merchant records' do
    create_list(:merchant, 3)

    get '/api/v1/merchants'

    merchants = JSON.parse(response.body)

    expect(response).to be_successful
    expect(merchants['data'].length).to eq(3)
  end

  it 'returns show record by id' do
    id = create(:merchant).id

    get "/api/v1/merchants/#{id}"

    merchant = JSON.parse(response.body)

    expect(response).to be_successful
    expect(merchant['data']['id'].to_i).to eq(id)
  end

  it 'finds record based on merchant id param' do
    create_list(:merchant, 3)
    merchant = create(:merchant)

    get "/api/v1/merchants/find?id=#{merchant.id}"

    json_merchant = JSON.parse(response.body)

    expect(response).to be_successful
    expect(json_merchant['data']['id'].to_i).to eq(merchant.id)
  end

  it 'finds record based on merchant name param' do
    create_list(:merchant, 3)
    merchant = create(:merchant)

    get "/api/v1/merchants/find?name=#{merchant.name}"

    json_merchant = JSON.parse(response.body)

    expect(response).to be_successful
    expect(json_merchant['data']['attributes']['name']).to eq(merchant.name)
  end

  it 'finds record based on creation timestamp' do
    create_list(:merchant, 3)
    merchant = create(:merchant, created_at: '2012-03-27 14:53:59')

    get "/api/v1/merchants/find?created_at=#{merchant.created_at}"

    json_merchant = JSON.parse(response.body)

    expect(response).to be_successful
    expect(json_merchant['data']['id'].to_i).to eq(merchant.id)
  end

  it 'finds record based on update timestamp' do
    create_list(:merchant, 3)
    merchant = create(:merchant, updated_at: '2012-03-27 14:53:59')

    get "/api/v1/merchants/find?updated_at=#{merchant.updated_at}"

    json_merchant = JSON.parse(response.body)

    expect(response).to be_successful
    expect(json_merchant['data']['id'].to_i).to eq(merchant.id)
  end
end
