require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'relationships' do
    it {should have_many :invoices}
    it {should have_many :items}
    it {should have_many(:customers).through(:invoices)}
    it {should have_many(:invoice_items).through(:invoices)}
    it {should have_many(:transactions).through(:invoices)}
  end

  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'class methods' do
    it 'rank by revenue' do
      customer = create(:customer)
      merchant = create(:merchant)
      merchant2 = create(:merchant)
      invoice = create(:invoice, customer: customer, merchant: merchant)
      invoice2 = create(:invoice, customer: customer, merchant: merchant2)
      item = create(:item, merchant: merchant)
      item2 = create(:item, merchant: merchant2)
      invoice_item = create(:invoice_item, quantity: '1', unit_price: '1.23', invoice: invoice, item: item)
      invoice_item2 = create(:invoice_item, quantity: '2', unit_price: '1.23', invoice: invoice2, item: item2)
      transaction = create(:transaction, result: 'success', invoice: invoice)
      transaction2 = create(:transaction, result: 'success', invoice: invoice2)

      expect(Merchant.rank_by_revenue(2)).to eq([merchant2, merchant])
    end
  end
end
