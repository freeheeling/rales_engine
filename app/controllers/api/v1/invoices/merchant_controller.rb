class Api::V1::Invoices::MerchantController < ApplicationController
  def show
    invoice = Invoice.find_by(id: params[:id])
    serialized_merchant = MerchantSerializer.new(invoice.merchant)
    render json: serialized_merchant
  end
end
