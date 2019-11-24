class Api::V1::Customers::QueryController < ApplicationController
  def show
    customer = Customer.find_by(query_params)
    serialized_customer = CustomerSerializer.new(customer)
    render json: serialized_customer
  end

  def index
    customers = Customer.where(query_params)
    serialized_customers = CustomerSerializer.new(customers)
    render json: serialized_customers
  end

  private
    def query_params
      params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
    end
end
