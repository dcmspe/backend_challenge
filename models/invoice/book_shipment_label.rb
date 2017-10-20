class BookShipmentLabel

    include ShipmentLabel

    def initialize()
       @type = :duty_free
       @message = "This item is duty free accoding to the law Art. 150, VI, d."
    end

end
