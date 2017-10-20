class Shipment

  attr_reader :order

  def initialize(order:)
    @order = order
  end

  def generate_shipment_label

    generate_shipment_label_for_books()
    generate_shipment_label_for_physical_items()
    generate_shipment_label_for_signature_service()
    generate_shipment_label_for_digital_media()
  end


  private

  def generate_shipment_label_for_books

    books = order.items.select { |item| item.type == :book}

    books.each do |book|
        book.shipment_label = BookShipmentLabel.new
    end
  end

  def generate_shipment_label_for_physical_items

    physical_items = order.items.select { |item| item.type == :physical_item}

    physical_items.each do |physical_item|
        physical_item.shipment_label = PhysicalItemShipmentLabel.new
    end
  end

  def generate_shipment_label_for_signature_service

    signature_service_items = order.items.select { |item| item.type == :signature_service}

    signature_service_items.each do |signature_service_item|
        signature_service_item.shipment_label = SignatureServiceShipmentLabel.new
    end
  end
  def generate_shipment_label_for_digital_media
    digital_media_items = order.items.select { |item| item.type == :digital_media}

    digital_media_items.each do |digital_media_item|
        digital_media_item.shipment_label = DigitalMediaShipmentLabel.new
    end
  end

end
