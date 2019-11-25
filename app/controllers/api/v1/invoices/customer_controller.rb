class Api::V1::Invoices::CustomerController < ApplicationController
  def show
    invoice = Invoice.find_by(id: params[:id])
    serialized_customer = CustomerSerializer.new(invoice.customer)
    render json: serialized_customer
  end
end
