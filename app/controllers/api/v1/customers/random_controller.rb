class Api::V1::Customers::RandomController < ApplicationController
  def show
    customer = Customer.all.sample
    serialized_customer = CustomerSerializer.new(customer)
    render json: serialized_customer
  end
end
