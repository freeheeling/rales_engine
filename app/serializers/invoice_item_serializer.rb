class InvoiceItemSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :quantity, :item_id, :invoice_id
  attribute :unit_price {|item| item.unit_price.to_s}
end
