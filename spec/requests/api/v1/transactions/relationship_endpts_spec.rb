require 'rails_helper'

RSpec.describe 'Transaction API relationship endpoint' do
  it 'returns invoice associated with a transaction' do
    invoice = create(:invoice)
    transaction = create(:transaction, invoice: invoice)

    get "/api/v1/transactions/#{transaction.id}/invoice"

    transaction_j = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful

    expect(transaction_j[:data][:id].to_i).to eq(invoice.id)
  end
end
