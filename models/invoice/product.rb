class Product
  # use type to distinguish each kind of product: physical, book, digital, membership, etc.
  attr_reader :name, :type, :price
  attr_accessor :shipment_label

  def initialize(name:, type:, price:)
    @name, @type, @price = name, type, price
  end

end
