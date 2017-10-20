class SignatureServiceShipmentLabel

    include ShipmentLabel

    def initialize()
       @type = :activate_signature
       #TODO send to the user this message
       @message = "The signature service will start in ..."
    end

end
