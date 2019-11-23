class MerchantRevenue
  def initialize(revenue)
    @revenue = revenue
  end

  def hash
    {data: {attributes: {total_revenue: @revenue.to_s}}}
  end
end
