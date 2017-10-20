class PhysicalItemShipmentLabel
  include ShipmentLabel

  def initialize()
     @type = :put_on_box_mailing
     @message = "Put this item on the box mailing!"
  end
end
