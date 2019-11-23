class Api::V1::InvoiceItems::InvoiceController < ApplicationController
  def show
    invoice_item = InvoiceItem.find_by(id: params[:id])
    serialized_invoice = InvoiceSerializer.new(invoice_item.invoice)
    render json: serialized_invoice
  end
end
