class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items
  has_many :customers, through: :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  validates_presence_of :name

  def self.rank_by_revenue(quantity)
    joins(:invoice_items, :transactions).
      select('merchants.*, sum(invoice_items.quantity * invoice_items.unit_price) AS revenue').
      group(:id).
      order('revenue DESC').
      limit(quantity)
  end

  def self.revenue_on_date(date)
    Invoice.joins(:invoice_items, :transactions).
      merge(Transaction.successful).
      where("date(invoices.created_at) = date('#{date}')").
      sum('invoice_items.quantity * invoice_items.unit_price').
      to_s
  end
end
