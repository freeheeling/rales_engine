class Api::V1::Merchants::CustomersController < ApplicationController
  def show
    merchant = Merchant.find_by(id: params[:id])
    customer = merchant.favorite_customer
    serialized_customer = CustomerSerializer.new(customer)
    render json: serialized_customer
  end
end
