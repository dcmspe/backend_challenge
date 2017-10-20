class Order

  attr_reader :customer, :items, :payment, :closed_at, :billing_address, :shipping_address

  def initialize(customer, billing_address, shipping_address)
    @customer = customer
    @items = []
    @billing_address = billing_address
    @shipping_address = shipping_address
  end

  def add_product(product)
    @items << product
  end

  def total_amount
    total = items.map {|item| item.price }.reduce(0, :+)
  end

  def close(closed_at = Time.now)
    @closed_at = closed_at
  end

  # remember: you can create new methods inside those classes to help you create a better design
end
