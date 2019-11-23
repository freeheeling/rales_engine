require 'rails_helper'

RSpec.describe 'Item API relationship endpoints' do
  it 'returns colleciton of invoice_items asscociated with an item' do
    item = create(:item)
    create_list(:invoice_item, 2, item: item)

    get "/api/v1/items/#{item.id}/invoice_items"

    invoice_items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice_items[:data].length).to eq(2)
  end
end
