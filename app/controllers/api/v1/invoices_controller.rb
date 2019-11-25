class Api::V1::InvoicesController < ApplicationController
  def index
    invoices = Invoice.all
    serialized_invoices = InvoiceSerializer.new(invoices)
    render json: serialized_invoices
  end

  def show
    invoice = Invoice.find(params[:id])
    serialized_invoice = InvoiceSerializer.new(invoice)
    render json: serialized_invoice
  end
end
