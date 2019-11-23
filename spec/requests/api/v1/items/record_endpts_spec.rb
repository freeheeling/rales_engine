require 'rails_helper'

RSpec.describe 'Item API record endpoints' do
  it 'returns index of item records' do
    create_list(:item, 3)

    get '/api/v1/items'

    items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(items[:data].length).to eq(3)
  end  
end
