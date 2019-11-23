require 'rails_helper'

RSpec.describe 'Merchant API business logic endpoints' do
  before :each do
    customer = create(:customer)
    @merchant = create(:merchant)
    @merchant2 = create(:merchant)
    @merchant3 = create(:merchant)
    @invoice = create(:invoice, merchant: @merchant, created_at: '2014-03-27 14:53:59')
    invoice2 = create(:invoice, merchant: @merchant2, created_at: @invoice.created_at)
    invoice3 = create(:invoice, merchant: @merchant3, created_at: @invoice.created_at)
    create(:invoice_item, quantity: '1', unit_price: '1.00', invoice: @invoice)
    create(:invoice_item, quantity: '2', unit_price: '2.00', invoice: invoice2)
    create(:invoice_item, quantity: '1', unit_price: '2.00', invoice: invoice3)
    create(:transaction, result: 'success', invoice: @invoice)
    create(:transaction, result: 'success', invoice: invoice2)
    create(:transaction, result: 'success', invoice: invoice3)
  end

  it 'returns variable number of merchants ranked by total revenue' do
    get '/api/v1/merchants/most_revenue?quantity=3'

    merchants = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(merchants[:data].length).to eq(3)
    expect(merchants[:data][0][:id].to_i).to eq(@merchant2.id)
    expect(merchants[:data][1][:id].to_i).to eq(@merchant3.id)
    expect(merchants[:data][2][:id].to_i).to eq(@merchant.id)
  end

  it 'returns cumulative revenue across all merchants for a given date' do
    get "/api/v1/merchants/revenue?date=#{@invoice.created_at}"

    merchants = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(merchants[:data][:attributes][:total_revenue]).to eq('7.0')
  end
end
