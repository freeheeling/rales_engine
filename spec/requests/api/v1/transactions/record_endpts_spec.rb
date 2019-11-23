require 'rails_helper'

RSpec.describe 'Transaction API record endpoints' do
  before :each do
    create_list(:transaction, 3)

    @invoice = create(:invoice)
    @transaction = create(
      :transaction,
      credit_card_number: '1716151413121110',
      result: 'failed',
      invoice_id: @invoice.id,
      created_at: '2014-03-27 14:53:59',
      updated_at: '2014-03-27 14:53:59'
    )
  end

  it 'returns index of transaction records' do
    get '/api/v1/transactions'

    transactions = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(transactions[:data].length).to eq(4)
  end

  it 'returns show record by transaction id' do
    id = create(:transaction).id

    get "/api/v1/transactions/#{id}"

    transaction = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(transaction[:data][:id].to_i).to eq(id)
  end

  it 'finds record based on transaction id query' do
    get "/api/v1/transactions/find?id=#{@transaction.id}"

    transaction = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(transaction[:data][:id].to_i).to eq(@transaction.id)
  end

  it 'finds record based on credit_card_number query' do
    get "/api/v1/transactions/find?credit_card_number=#{@transaction.credit_card_number}"

    transaction = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(transaction[:data][:id].to_i).to eq(@transaction.id)
  end

  it 'finds record based on transaction result query' do
    get "/api/v1/transactions/find?result=#{@transaction.result}"

    transaction = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(transaction[:data][:id].to_i).to eq(@transaction.id)
  end

  it 'finds record based on invoice id query' do
    get "/api/v1/transactions/find?invoice_id=#{@transaction.invoice_id}"

    transaction = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(transaction[:data][:id].to_i).to eq(@transaction.id)
  end

  it 'finds record based on creation timestamp query' do
    get "/api/v1/transactions/find?created_at=#{@transaction.created_at}"

    transaction = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(transaction[:data][:id].to_i).to eq(Transaction.ids.first)
  end

  it 'finds record based on update timestamp query' do
    get "/api/v1/transactions/find?updated_at=#{@transaction.updated_at}"

    transaction = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(transaction[:data][:id].to_i).to eq(Transaction.ids.first)
  end

  
end
