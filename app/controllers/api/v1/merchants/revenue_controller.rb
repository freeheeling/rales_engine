class Api::V1::Merchants::RevenueController < ApplicationController
  def index
    merchants = Merchant.rank_by_revenue(params[:quantity])
    serialized_merchants = MerchantSerializer.new(merchants)
    render json: serialized_merchants
  end

  def show
    revenue = Merchant.revenue_on_date(params[:date])
    hashed_revenue = MerchantRevenue.new(revenue).hash
    render json: hashed_revenue
  end
end
