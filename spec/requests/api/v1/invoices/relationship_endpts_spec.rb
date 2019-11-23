require 'rails_helper'

RSpec.describe 'Invoice API relationship endpoints' do
  it 'returns collection of transactions associated with an invoice' do
    invoice = create(:invoice)
    transactions = create_list(:transaction, 2, invoice: invoice)

    get "/api/v1/invoices/#{invoice.id}/transactions"

    transactions_j = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(transactions_j[:data].length).to eq(2)
  end
end
