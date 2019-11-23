class Api::V1::Merchants::ItemsController < ApplicationController
  def index
    merchant = Merchant.find_by(id: params[:id])
    serialized_items = ItemSerializer.new(merchant.items)
    render json: serialized_items
  end
end
