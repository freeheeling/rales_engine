class Api::V1::Customers::TransactionsController < ApplicationController
  def index
    customer = Customer.find_by(id: params[:id])
    serialized_transactions = TransactionSerializer.new(customer.transactions)
    render json: serialized_transactions
  end
end
