class Api::V1::Invoices::TransactionsController < ApplicationController
  def index
    invoice = Invoice.find_by(id: params[:id])
    serialized_transactions = TransactionSerializer.new(invoice.transactions)
    render json: serialized_transactions
  end
end
