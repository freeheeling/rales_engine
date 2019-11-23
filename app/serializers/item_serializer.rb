class ItemSerializer
  include FastJsonapi::ObjectSerializer

  attributes :name, :description, :id, :merchant_id
  attribute :unit_price {|item| item.unit_price.to_s}
end
