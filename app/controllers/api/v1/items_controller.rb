class Api::V1::ItemsController < ApplicationController
  def index
    items = Item.all
    serialized_items = ItemSerializer.new(items)
    render json: serialized_items
  end
end
