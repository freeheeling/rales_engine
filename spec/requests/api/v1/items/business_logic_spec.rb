require 'rails_helper'

RSpec.describe 'Item API business logic endpoints' do
  it 'returns variable number of items ranked by total revenue' do
    item = create(:item)
    item2 = create(:item)
    item3 = create(:item)
    invoice = create(:invoice)
    invoice2 = create(:invoice)
    invoice3 = create(:invoice)
    create(
      :invoice_item,
      quantity: '1',
      unit_price: '1.00',
      item: item,
      invoice: invoice
    )
    create(
      :invoice_item,
      quantity: '2',
      unit_price: '2.00',
      item: item2,
      invoice: invoice2
    )
    create(
      :invoice_item,
      quantity: '1',
      unit_price: '2.00',
      item: item3,
      invoice: invoice3
    )
    create(:transaction, invoice: invoice)
    create(:transaction, invoice: invoice2)
    create(:transaction, invoice: invoice3)

    get '/api/v1/items/most_revenue?quantity=2'

    items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(items[:data].length).to eq(2)
    expect(items[:data][0][:id].to_i).to eq(item2.id)
    expect(items[:data][1][:id].to_i).to eq(item3.id)
  end
end
