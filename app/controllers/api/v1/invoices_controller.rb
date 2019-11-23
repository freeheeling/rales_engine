class Api::V1::InvoicesController < ApplicationController
  def index
    invoices = Invoice.all
    serialized_invoices = InvoiceSerializer.new(invoices)
    render json: serialized_invoices
  end
end
