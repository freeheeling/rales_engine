class Api::V1::Merchants::RevenueController < ApplicationController
  def index
    merchants = Merchant.rank_by_revenue(params[:quantity])
    serialized_merchants = MerchantSerializer.new(merchants)
    render json: serialized_merchants
  end
end
