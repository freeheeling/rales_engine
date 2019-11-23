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
    before :each do
      customer = create(:customer)
      @merchant = create(:merchant)
      @merchant2 = create(:merchant)
      @merchant3 = create(:merchant)
      @invoice = create(:invoice, merchant: @merchant, created_at: '2014-03-27 14:53:59')
      invoice2 = create(:invoice, merchant: @merchant2, created_at: @invoice.created_at)
      invoice3 = create(:invoice, merchant: @merchant3, created_at: @invoice.created_at)
      create(:invoice_item, quantity: '1', unit_price: '1.00', invoice: @invoice)
      create(:invoice_item, quantity: '2', unit_price: '2.00', invoice: invoice2)
      create(:invoice_item, quantity: '1', unit_price: '2.00', invoice: invoice3)
      create(:transaction, result: 'success', invoice: @invoice)
      create(:transaction, result: 'success', invoice: invoice2)
      create(:transaction, result: 'success', invoice: invoice3)
    end

    it 'rank by revenue' do
      expect(Merchant.rank_by_revenue(3)).to eq([@merchant2, @merchant3, @merchant])
    end

    it 'revenue on date' do
      expect(Merchant.revenue_on_date(@invoice.created_at)).to eq('7.0')
    end
  end
end
