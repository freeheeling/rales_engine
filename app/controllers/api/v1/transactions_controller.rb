class Api::V1::TransactionsController < ApplicationController
  def index
    transactions = Transaction.all
    serialized_transactions = TransactionSerializer.new(transactions)
    render json: serialized_transactions
  end
end
