class Api::V1::CustomersController < ApplicationController
  def index
    customers = Customer.all
    serialized_customers = CustomerSerializer.new(customers)
    render json: serialized_customers
  end
end
