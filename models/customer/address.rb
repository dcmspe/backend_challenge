class Address
  attr_reader :zipcode, :type

  def initialize(zipcode, type)
    @zipcode = zipcode
    @type = type
  end

end
