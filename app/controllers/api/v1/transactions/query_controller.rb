class Api::V1::Transactions::QueryController < ApplicationController
  def show
    transaction = Transaction.find_by(query_params)
    serialized_transaction = TransactionSerializer.new(transaction)
    render json: serialized_transaction
  end

  def index
    transactions = Transaction.where(query_params)
    serialized_transactions = TransactionSerializer.new(transactions.order(:id))
    render json: serialized_transactions
  end

  private
    def query_params
      params.permit(
        :id,
        :credit_card_number,
        :result,
        :invoice_id,
        :created_at,
        :updated_at
      )
    end
end
