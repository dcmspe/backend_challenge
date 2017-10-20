class DigitalMediaShipmentLabel

  include ShipmentLabel

  def initialize()
     @type = :digital_media_voucher
     #TODO Implment a voucher policy
     @message = "Yoy have a voucher of R$10,00!"
  end
end
