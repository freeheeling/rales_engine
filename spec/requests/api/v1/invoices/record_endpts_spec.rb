require 'rails_helper'

RSpec.describe 'Invoice API record endpoints' do
  it 'returns index of invoice records' do
    create_list(:invoice, 3)

    get '/api/v1/invoices'

    invoices = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoices[:data].length).to eq(3)
  end
end
