class Api::V1::Items::InvoiceItemsController < ApplicationController
  def index
    item = Item.find_by(id: params[:id])
    serialized_invoice_items = InvoiceItemSerializer.new(item.invoice_items)
    render json: serialized_invoice_items
  end
end
