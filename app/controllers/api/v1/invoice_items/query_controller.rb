class Api::V1::InvoiceItems::QueryController < ApplicationController
  def show
    invoice_item = InvoiceItem.find_by(query_params)
    serialized_invoice_item = InvoiceItemSerializer.new(invoice_item)
    render json: serialized_invoice_item
  end

  private
    def query_params
      params.permit(
        :id,
        :quanity,
        :unit_price,
        :item_id,
        :invoice_id,
        :created_at,
        :updated_at
      )
    end
end
