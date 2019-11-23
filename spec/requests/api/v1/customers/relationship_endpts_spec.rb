require 'rails_helper'

RSpec.describe 'Customer API relationship endpoints' do
  it 'returns collection of invoices associated with customer' do
    customer = create(:customer)
    merchant = create(:merchant)
    invoices = create_list(:invoice, 2, customer: customer, merchant: merchant)

    get "/api/v1/customers/#{customer.id}/invoices"

    invoices_j = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoices_j[:data].length).to eq(2)
  end
end
