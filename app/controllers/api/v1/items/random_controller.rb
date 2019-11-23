class Api::V1::Items::RandomController < ApplicationController
  def show
    item = Item.all.sample
    serialized_item = ItemSerializer.new(item)
    render json: serialized_item
  end
end
