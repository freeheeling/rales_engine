class Api::V1::InvoiceItems::QueryController < ApplicationController
  def show
    invoice_item = InvoiceItem.find_by(query_params)
    serialized_inv_item = InvoiceItemSerializer.new(invoice_item)
    render json: serialized_inv_item
  end

  def index
    invoice_items = InvoiceItem.where(query_params)
    serialized_inv_items = InvoiceItemSerializer.new(invoice_items.order(:id))
    render json: serialized_inv_items
  end

  private
    def query_params
      params.permit(
        :id,
        :quantity,
        :unit_price,
        :item_id,
        :invoice_id,
        :created_at,
        :updated_at
      )
    end
end
