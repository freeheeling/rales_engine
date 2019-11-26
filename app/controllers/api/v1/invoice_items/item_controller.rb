class Api::V1::InvoiceItems::ItemController < ApplicationController
  def show
    invoice_item = InvoiceItem.find_by(id: params[:id])
    serialized_item = ItemSerializer.new(invoice_item.item)
    render json: serialized_item
  end
end
