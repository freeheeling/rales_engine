require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'relationships' do
    it {should belong_to :merchant}

    it {should have_many :invoice_items}
    it {should have_many(:invoices).through(:invoice_items)}
    it {should have_many(:transactions).through(:invoices)}
  end

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
    it {should validate_presence_of :unit_price}
  end

  describe 'class methods' do
    it 'rank by revenue' do
      item = create(:item)
      item2 = create(:item)
      invoice = create(:invoice)
      invoice2 = create(:invoice)
      create(
        :invoice_item,
        quantity: '1',
        unit_price: '1.00',
        item: item,
        invoice: invoice
      )
      create(
        :invoice_item,
        quantity: '2',
        unit_price: '2.00',
        item: item2,
        invoice: invoice2
      )
      create(:transaction, invoice: invoice)
      create(:transaction, invoice: invoice2)

      expect(Item.rank_by_revenue(2)).to eq([item2, item])
    end
  end
end
