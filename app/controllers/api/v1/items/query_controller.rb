class Api::V1::Items::QueryController < ApplicationController
  def show
    item = Item.find_by(query_params)
    serialized_item = ItemSerializer.new(item)
    render json: serialized_item
  end

  private
    def query_params
      params.permit(:id,
        :name,
        :description,
        :unit_price,
        :merchant_id,
        :created_at,
        :updated_at
      )
    end
end
