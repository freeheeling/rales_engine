class Api::V1::Merchants::QueryController < ApplicationController
  def show
    merchant = Merchant.find_by(query_params)
    serialized_merchant = MerchantSerializer.new(merchant)
    render json: serialized_merchant
  end

  def index
    merchants = Merchant.where(query_params)
    serialized_merchants = MerchantSerializer.new(merchants)
    render json: serialized_merchants
  end

  private
    def query_params
      params.permit(:id, :name, :created_at, :updated_at)
    end
end
