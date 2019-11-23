require 'rails_helper'

RSpec.describe 'Invoice Item API record endpoints' do
  before :each do
    create_list(:invoice_item, 3)

    @item = create(:item)
    @invoice = create(:invoice)
    @invoice_item = create(
      :invoice_item,
      quantity: '1',
      unit_price: '1.23',
      item_id: @item.id,
      invoice_id: @invoice.id,
      created_at: '2014-03-27 14:53:59',
      updated_at: '2014-03-27 14:53:59'
    )
  end

  it 'returns index of invoice item records' do
    get '/api/v1/invoice_items'

    invoice_items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice_items[:data].length).to eq(4)
  end

  it 'returns show record by id' do
    get "/api/v1/invoice_items/#{@invoice_item.id}"

    invoice_item = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice_item[:data][:attributes][:id]).to eq(@invoice_item.id)
  end

  it 'finds record based on invoice item id query' do
    get "/api/v1/invoice_items/find?id=#{@invoice_item.id}"

    invoice_item = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice_item[:data][:attributes][:id]).to eq(@invoice_item.id)
  end

  it 'finds record based on invoice item quantity query' do
    get "/api/v1/invoice_items/find?quantity=#{@invoice_item.quantity}"

    invoice_item = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice_item[:data][:attributes][:id]).to eq(InvoiceItem.ids.first)
  end

  it 'finds record based on invoice item unit price query' do
    get "/api/v1/invoice_items/find?unit_price=#{@invoice_item.unit_price}"

    invoice_item = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice_item[:data][:attributes][:id]).to eq(@invoice_item.id)
  end

  it 'finds record based on item id query' do
    get "/api/v1/invoice_items/find?item_id=#{@invoice_item.item_id}"

    invoice_item = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice_item[:data][:attributes][:id]).to eq(@invoice_item.id)
  end

  it 'finds record based on invoice id query' do
    get "/api/v1/invoice_items/find?invoice_id=#{@invoice_item.invoice_id}"

    invoice_item = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice_item[:data][:attributes][:id]).to eq(@invoice_item.id)
  end

  it 'finds record based on creation timestamp query' do
    get "/api/v1/invoice_items/find?created_at=#{@invoice_item.created_at}"

    invoice_item = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice_item[:data][:attributes][:id]).to eq(@invoice_item.id)
  end

  it 'finds record based on update timestamp query' do
    get "/api/v1/invoice_items/find?updated_at=#{@invoice_item.updated_at}"

    invoice_item = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice_item[:data][:attributes][:id]).to eq(@invoice_item.id)
  end
end
