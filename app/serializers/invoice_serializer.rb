class InvoiceSerializer
  include FastJsonapi::ObjectSerializer
  attributes :status, :id, :merchant_id, :customer_id
end
