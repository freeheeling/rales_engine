class Api::V1::Customers::InvoicesController < ApplicationController
  def index
    customer = Customer.find_by(id: params[:id])
    serialized_invoices = InvoiceSerializer.new(customer.invoices)
    render json: serialized_invoices
  end
end
