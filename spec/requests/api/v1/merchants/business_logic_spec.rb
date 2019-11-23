require 'rails_helper'

RSpec.describe 'Merchant API business logic endpoints' do
  it 'returns variable number of merchants ranked by total revenue' do
    customer = create(:customer)
    merchant = create(:merchant)
    merchant2 = create(:merchant)
    invoice = create(:invoice, customer: customer, merchant: merchant)
    invoice2 = create(:invoice, customer: customer, merchant: merchant2)
    item = create(:item, merchant: merchant)
    item2 = create(:item, merchant: merchant2)
    invoice_item = create(:invoice_item, quantity: '1', unit_price: '1.23', invoice: invoice, item: item)
    invoice_item2 = create(:invoice_item, quantity: '2', unit_price: '1.23', invoice: invoice2, item: item2)
    transaction = create(:transaction, result: 'success', invoice: invoice)
    transaction2 = create(:transaction, result: 'success', invoice: invoice2)
    get '/api/v1/merchants/most_revenue?quantity=2'

    merchants = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(merchants[:data].length).to eq(2)
    expect(merchants[:data][0][:id].to_i).to eq(merchant2.id)
    expect(merchants[:data][1][:id].to_i).to eq(merchant.id)
  end
end
