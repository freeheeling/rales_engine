require 'rails_helper'

RSpec.describe 'Item API relationship endpoints' do
  it 'returns collection of invoice_items asscociated with an item' do
    item = create(:item)
    create_list(:invoice_item, 2, item: item)

    get "/api/v1/items/#{item.id}/invoice_items"

    invoice_items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice_items[:data].length).to eq(2)
  end

  it 'returns merchant associated with an item' do
    merchant = create(:merchant)
    item = create(:item, merchant: merchant)

    get "/api/v1/items/#{item.id}/merchant"

    merchant_j = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(merchant_j[:data][:id].to_i).to eq(merchant.id)
  end
end
