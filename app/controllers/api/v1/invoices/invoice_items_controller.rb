class Api::V1::Invoices::InvoiceItemsController < ApplicationController
  def index
    invoice = Invoice.find_by(id: params[:id])
    serialized_invoice_items = InvoiceItemsSerializer.new(invoice.invoice_items)
    render json: serialized_invoice_items
  end
end
