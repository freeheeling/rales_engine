class Api::V1::InvoiceItems::RandomController < ApplicationController
  def show
    invoice_item = InvoiceItem.all.sample
    serialized_inv_item = InvoiceItemSerializer.new(invoice_item)
    render json: serialized_inv_item
  end
end
