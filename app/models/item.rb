class Item < ApplicationRecord
  belongs_to :merchant

  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  has_many :transactions, through: :invoices

  validates_presence_of :name, :description, :unit_price

  def self.rank_by_revenue(quantity)
    joins(:transactions).
      select('items.*, sum(invoice_items.quantity * invoice_items.unit_price) AS revenue').
      merge(Transaction.successful).
      group(:id).
      order('revenue DESC').
      limit(quantity)
  end
end
