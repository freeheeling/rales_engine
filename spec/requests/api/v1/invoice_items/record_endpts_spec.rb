require 'rails_helper'

RSpec.describe 'Invoice Item API record endpoints' do
  it 'returns index of invoice item records' do
    create_list(:invoice_item, 3)

    get '/api/v1/invoice_items'

    invoice_items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice_items[:data].length).to eq(3)
  end

  it 'returns show record by id' do
    id = create(:invoice_item).id

    get "/api/v1/invoice_items/#{id}"

    invoice_item = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice_item[:data][:id].to_i).to eq(id)
  end
end
