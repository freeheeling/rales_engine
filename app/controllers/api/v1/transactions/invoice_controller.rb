class Api::V1::Transactions::InvoiceController < ApplicationController
  def show
    transaction = Transaction.find_by(id: params[:id])
    serialized_invoice = InvoiceSerializer.new(transaction.invoice)
    render json: serialized_invoice
  end
end
