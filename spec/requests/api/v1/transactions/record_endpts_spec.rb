require 'rails_helper'

RSpec.describe 'Transaction API record endpoints' do
  before :each do
    create_list(:transaction, 3)
  end

  it 'returns index of transaction records' do
    get '/api/v1/transactions'

    transactions = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(transactions[:data].length).to eq(3)
  end

  it 'returns show record by transaction id' do
    id = create(:transaction).id

    get "/api/v1/transactions/#{id}"

    transaction = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(transaction[:data][:id].to_i).to eq(id)
  end
end
