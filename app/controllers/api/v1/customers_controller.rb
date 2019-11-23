class Api::V1::CustomersController < ApplicationController
  def index
    customers = Customer.all
    serialized_customers = CustomerSerializer.new(customers)
    render json: serialized_customers
  end

  def show
    customer = Customer.find(params[:id])
    serialized_customer = CustomerSerializer.new(customer)
    render json: serialized_customer
  end
end
