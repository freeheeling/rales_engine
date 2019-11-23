class Api::V1::Invoices::QueryController < ApplicationController
  def show
    invoice = Invoice.find_by(query_params)
    serialized_invoice = InvoiceSerializer.new(invoice)
    render json: serialized_invoice
  end

  private
    def query_params
      params.permit(:id, :customer_id, :merchant_id, :status, :created_at, :updated_at)
    end
end
