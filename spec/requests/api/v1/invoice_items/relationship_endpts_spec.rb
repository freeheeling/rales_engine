require 'rails_helper'

RSpec.describe 'Invoice Item API relationship endpoints' do
  it 'returns invoice associated with an invoice item' do
    invoice = create(:invoice)
    invoice_item = create(:invoice_item, invoice: invoice)

    get "/api/v1/invoice_items/#{invoice_item.id}/invoice"

    invoice_item_j = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice_item_j[:data][:attributes][:id]).to eq(invoice.id)
  end
end
