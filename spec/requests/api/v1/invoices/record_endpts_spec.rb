require 'rails_helper'

RSpec.describe 'Invoice API record endpoints' do
  before :each do
    create_list(:invoice, 3)

    @invoice = create(
      :invoice,
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

  it 'finds record based on invoice status' do
    get "/api/v1/invoices/find?status=#{@invoice.status}"

    invoice = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice[:data][:id].to_i).to eq(Invoice.ids.first)
  end

  it 'finds record based on customer id' do
    get "/api/v1/invoices/find?customer_id=#{@invoice.customer_id}"

    invoice = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice[:data][:id].to_i).to eq(@invoice.id)
  end

  it 'finds record based on merchant id' do
    get "/api/v1/invoices/find?merchant_id=#{@invoice.merchant_id}"

    invoice = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice[:data][:id].to_i).to eq(@invoice.id)
  end

  it 'finds record based on creation timestamp' do
    get "/api/v1/invoices/find?created_at=#{@invoice.created_at}"

    invoice = JSON.parse(response.body , symbolize_names: true)

    expect(response).to be_successful
    expect(invoice[:data][:id].to_i).to eq(@invoice.id)
  end

  it 'finds record based on update timestamp' do
    get "/api/v1/invoices/find?updated_at=#{@invoice.updated_at}"

    invoice = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(invoice[:data][:id].to_i).to eq(@invoice.id)
  end
end
