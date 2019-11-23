require 'rails_helper'

RSpec.describe 'Merchant API business logic endpoints' do
  before :each do
    customer = create(:customer)
    @merchant = create(:merchant)
    @merchant2 = create(:merchant)
    invoice = create(:invoice, customer: customer, merchant: @merchant)
    invoice2 = create(:invoice, customer: customer, merchant: @merchant2)
    item = create(:item, merchant: @merchant)
    item2 = create(:item, merchant: @merchant2)
    @invoice_item = create(
      :invoice_item,
      quantity: '1',
      unit_price: '1.00',
      invoice: invoice,
      item: item,
      created_at: '2014-03-27 14:53:59'
    )
    invoice_item2 = create(
      :invoice_item,
      quantity: '1',
      unit_price: '2.00',
      invoice: invoice2,
      item: item2,
      created_at: @invoice_item.created_at
    )
    transaction = create(:transaction, result: 'success', invoice: invoice)
    transaction2 = create(:transaction, result: 'success', invoice: invoice2)
  end

  it 'returns variable number of merchants ranked by total revenue' do
    get '/api/v1/merchants/most_revenue?quantity=2'

    merchants = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(merchants[:data].length).to eq(2)
    expect(merchants[:data][0][:id].to_i).to eq(@merchant2.id)
    expect(merchants[:data][1][:id].to_i).to eq(@merchant.id)
  end
end
