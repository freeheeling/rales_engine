class Api::V1::Transactions::QueryController < ApplicationController
  def show
    transaction = Transaction.find_by(query_params)
    serialized_transaction = TransactionSerializer.new(transaction)
    render json: serialized_transaction
  end

  private
    def query_params
      params.permit(:id, :credit_card_number, :result, :invoice_id)
    end
end
