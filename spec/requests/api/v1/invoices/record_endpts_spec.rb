require 'rails_helper'

RSpec.describe 'Invoice API record endpoints' do
  before :each do
    create_list(:invoice, 3)

    @customer = create(:customer)
    @merchant = create(:merchant)
    @invoice = create(
      :invoice,
      customer: @customer,
      merchant: @merchant,
      status: 'shipped',
      created_at: '2014-03-27 14:53:59',
      updated_at: '2014-03-27 14:53:59'
    )
  end

  it 'returns index of invoice records' do
    get '/api/v1/invoices'

    invoices = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoices[:data].length).to eq(4)
  end

  it 'returns show record by id' do
    id = create(:invoice).id

    get "/api/v1/invoices/#{id}"

    invoice = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice[:data][:id].to_i).to eq(id)
  end

  it 'finds record based on invoice id query' do
    get "/api/v1/invoices/find?id=#{@invoice.id}"

    invoice = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice[:data][:id].to_i).to eq(@invoice.id)
  end

  it 'finds record based on invoice status query' do
    get "/api/v1/invoices/find?status=#{@invoice.status}"

    invoice = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice[:data][:id].to_i).to eq(Invoice.ids.first)
  end

  it 'finds record based on customer id query' do
    get "/api/v1/invoices/find?customer_id=#{@invoice.customer_id}"

    invoice = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice[:data][:id].to_i).to eq(@invoice.id)
  end

  it 'finds record based on merchant id query' do
    get "/api/v1/invoices/find?merchant_id=#{@invoice.merchant_id}"

    invoice = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice[:data][:id].to_i).to eq(@invoice.id)
  end

  it 'finds record based on creation timestamp query' do
    get "/api/v1/invoices/find?created_at=#{@invoice.created_at}"

    invoice = JSON.parse(response.body , symbolize_names: true)

    expect(response).to be_successful
    expect(invoice[:data][:id].to_i).to eq(@invoice.id)
  end

  it 'finds record based on update timestamp query' do
    get "/api/v1/invoices/find?updated_at=#{@invoice.updated_at}"

    invoice = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice[:data][:id].to_i).to eq(@invoice.id)
  end

  it 'finds all records based on invoice id query' do
    get "/api/v1/invoices/find_all?id=#{@invoice.id}"

    invoices = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoices[:data].length).to eq(1)
    expect(invoices[:data][0][:id].to_i).to eq(@invoice.id)
  end

  it 'finds all records based on invoice status query' do
    get "/api/v1/invoices/find_all?status=#{@invoice.status}"

    invoices = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoices[:data].length).to eq(4)
    expect(invoices[:data][0][:attributes][:status]).to eq(@invoice.status)
  end

  it 'finds all records based on customer id query' do
    invoice2 = create(:invoice, customer: @customer)

    get "/api/v1/invoices/find_all?customer_id=#{@customer.id}"

    invoices = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoices[:data].length).to eq(2)
    expect(invoices[:data][0][:attributes][:id].to_i).to eq(@invoice.id)
  end

  it 'finds all records based on merchant id query' do
    invoice2 = create(:invoice, merchant: @merchant)

    get "/api/v1/invoices/find_all?merchant_id=#{@merchant.id}"

    invoices = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoices[:data].length).to eq(2)
    expect(invoices[:data][0][:attributes][:id].to_i).to eq(@invoice.id)
  end

  it 'finds all records based on creation timestamp query' do
    invoice2 = create(:invoice, created_at: '2014-03-27 14:53:59')

    get "/api/v1/invoices/find_all?created_at=#{@invoice.created_at}"

    invoices = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoices[:data].length).to eq(2)
    expect(invoices[:data][0][:id].to_i).to eq(@invoice.id)
  end

  it 'finds all records based on update timestamp query' do
    invoice2 = create(:invoice, updated_at: '2014-03-27 14:53:59')

    get "/api/v1/invoices/find_all?updated_at=#{@invoice.updated_at}"

    invoices = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoices[:data].length).to eq(2)
    expect(invoices[:data][0][:id].to_i).to eq(@invoice.id)
  end

  it 'returns a random invoice' do
    get '/api/v1/invoices/random'

    invoice = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice[:data]).to be_instance_of Hash
    expect(invoice[:data][:type]).to eq('invoice')
  end
end
