require 'rails_helper'

RSpec.describe 'Merchant API relationship endpoints' do
  it 'returns collection of items associated with merchant' do
    merchant = create(:merchant)
    items = create_list(:item, 2, merchant: merchant)

    get "/api/v1/merchants/#{merchant.id}/items"

    items_j = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(items_j[:data].length).to eq(2)
  end
end
