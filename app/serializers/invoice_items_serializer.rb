class InvoiceItemsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :quantity, :unit_price, :item_id, :invoice_id
end
