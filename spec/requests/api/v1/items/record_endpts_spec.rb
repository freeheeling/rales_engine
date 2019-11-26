require 'rails_helper'

RSpec.describe 'Item API record endpoints' do
  before :each do
    create_list(:item, 3)

    @merchant = create(:merchant)
    @item = create(
      :item,
      name: 'Wheel',
      description: 'goes round',
      unit_price: '1.23',
      merchant_id: @merchant.id,
      created_at: '2014-03-27 14:53:59',
      updated_at: '2014-03-27 14:53:59'
    )
  end

  it 'returns index of item records' do
    get '/api/v1/items'

    items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(items[:data].length).to eq(4)
  end

  it 'returns show record by item id' do
    id = create(:item).id

    get "/api/v1/items/#{id}"

    item = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(item[:data][:id].to_i).to eq(id)
  end

  it 'finds record based on item id query' do
    get "/api/v1/items/find?id=#{@item.id}"

    item = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(item[:data][:id].to_i).to eq(@item.id)
  end

  it 'finds record based on item name query' do
    get "/api/v1/items/find?name=#{@item.name}"

    item = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(item[:data][:id].to_i).to eq(@item.id)
  end

  it 'finds record based on item description query' do
    get "/api/v1/items/find?description=#{@item.description}"

    item = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(item[:data][:id].to_i).to eq(@item.id)
  end

  it 'finds record based on item unit_price query' do
    get "/api/v1/items/find?unit_price=#{@item.unit_price}"

    item = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(item[:data][:id].to_i).to eq(@item.id)
  end

  it 'finds record based on merchant id query' do
    get "/api/v1/items/find?merchant_id=#{@item.merchant_id}"

    item = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(item[:data][:id].to_i).to eq(@item.id)
  end

  it 'finds record based on creation timestamp query' do
    get "/api/v1/items/find?created_at=#{@item.created_at}"

    item = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(item[:data][:id].to_i).to eq(@item.id)
  end

  it 'finds record based on update timestamp query' do
    get "/api/v1/items/find?updated_at=#{@item.updated_at}"

    item = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(item[:data][:id].to_i).to eq(@item.id)
  end

  it 'finds all records based on item id query' do
    get "/api/v1/items/find_all?id=#{@item.id}"

    items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(items[:data].length).to eq(1)
    expect(items[:data][0][:id].to_i).to eq(@item.id)
  end

  it 'finds all records based on item name query' do
    item2 = create(:item, name: @item.name)

    get "/api/v1/items/find_all?name=#{@item.name}"

    items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(items[:data].length).to eq(2)
    expect(items[:data][0][:id].to_i).to eq(@item.id)
  end

  it 'finds all records based on item description query' do
    item2 = create(:item, description: @item.description)

    get "/api/v1/items/find_all?description=#{@item.description}"

    items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(items[:data].length).to eq(2)
    expect(items[:data][0][:id].to_i).to eq(@item.id)
  end

  it 'finds all records based on item unit_price query' do
    item2 = create(:item, unit_price: @item.unit_price)

    get "/api/v1/items/find_all?unit_price=#{@item.unit_price}"

    items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(items[:data].length).to eq(2)
    expect(items[:data][0][:id].to_i).to eq(@item.id)
  end

  it 'finds all records based on merchant id query' do
    item2 = create(:item, merchant_id: @item.merchant_id)

    get "/api/v1/items/find_all?merchant_id=#{@item.merchant_id}"

    items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(items[:data].length).to eq(2)
    expect(items[:data][0][:id].to_i).to eq(@item.id)
  end

  it 'finds all records based on creation timestamp query' do
    item2 = create(:item, created_at: @item.created_at)

    get "/api/v1/items/find_all?created_at=#{@item.created_at}"

    items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(items[:data].length).to eq(2)
    expect(items[:data][0][:id].to_i).to eq(@item.id)
  end

  it 'finds all records based on update timestamp query' do
    item2 = create(:item, updated_at: @item.updated_at)

    get "/api/v1/items/find_all?updated_at=#{@item.updated_at}"

    items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(items[:data].length).to eq(2)
    expect(items[:data][0][:id].to_i).to eq(@item.id)
  end

  it 'returns a random item' do
    get '/api/v1/items/random'

    item = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(item[:data]).to be_instance_of Hash
    expect(item[:data][:type]).to eq('item')
  end
end
