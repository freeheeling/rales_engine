class Api::V1::InvoiceItemsController < ApplicationController
  def index
    invoice_items = InvoiceItem.all
    serialized_invoice_items = InvoiceItemSerializer.new(invoice_items)
    render json: serialized_invoice_items
  end
end
