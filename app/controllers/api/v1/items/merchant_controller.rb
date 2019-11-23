class Api::V1::Items::MerchantController < ApplicationController
  def show
    item = Item.find_by(id: params[:id])
    serialized_merchant = MerchantSerializer.new(item.merchant)
    render json: serialized_merchant
  end
end
