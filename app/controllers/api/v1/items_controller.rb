class Api::V1::ItemsController < ApplicationController
  def index
    items = Item.all
    serialized_items = ItemSerializer.new(items)
    render json: serialized_items
  end

  def show
    item = Item.find(params[:id])
    serialized_item = ItemSerializer.new(item)
    render json: serialized_item
  end
end
