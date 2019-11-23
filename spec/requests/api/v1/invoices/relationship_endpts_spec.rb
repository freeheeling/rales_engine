require 'rails_helper'

RSpec.describe 'Invoice API relationship endpoints' do
  before :each do
    @invoice = create(:invoice)
  end

  it 'returns collection of transactions associated with an invoice' do
    create_list(:transaction, 2, invoice: @invoice)

    get "/api/v1/invoices/#{@invoice.id}/transactions"

    transactions_j = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(transactions_j[:data].length).to eq(2)
  end

  it 'returns collection of invoice_items associated with an invoice' do
    create_list(:invoice_item, 2, invoice: @invoice)

    get "/api/v1/invoices/#{@invoice.id}/invoice_items"

    invoice_items_j = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice_items_j[:data].length).to eq(2)
  end

  it 'returns collection of items associated with an invoice' do
    merchant = create(:merchant)
    item = create(:item, merchant: merchant)
    item2 = create(:item, merchant: merchant)
    create(:invoice_item, invoice: @invoice, item: item)
    create(:invoice_item, invoice: @invoice, item: item2)

    get "/api/v1/invoices/#{@invoice.id}/items"

    items_j = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(items_j[:data].length).to eq(2)
  end
end
