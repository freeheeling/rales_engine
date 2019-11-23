class Api::V1::Merchants::InvoicesController < ApplicationController
  def index
    merchant = Merchant.find_by(id: params[:id])
    serialized_invoices = InvoiceSerializer.new(merchant.invoices)
    render json: serialized_invoices
  end
end
