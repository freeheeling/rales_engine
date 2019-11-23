class Api::V1::Invoices::QueryController < ApplicationController
  def show
    invoice = Invoice.find_by(query_params)
    serialized_invoice = InvoiceSerializer.new(invoice)
    render json: serialized_invoice
  end

  def index
    invoices = Invoice.where(query_params)
    serialized_invoices = InvoiceSerializer.new(invoices.order(:id))
    render json: serialized_invoices
  end

  private
    def query_params
      params.permit(:id, :customer_id, :merchant_id, :status, :created_at, :updated_at)
    end
end
