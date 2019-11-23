class Api::V1::Items::RevenueController < ApplicationController
  def index
    items = Item.rank_by_revenue(params[:quantity])
    serialized_items = ItemSerializer.new(items)
    render json: serialized_items
  end
end
