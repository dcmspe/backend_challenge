require 'spec_helper'
require 'byebug'

require_relative '../models/invoice/product'
require_relative '../models/invoice/order'
require_relative '../models/invoice/invoice'
require_relative '../models/invoice/payment'
require_relative '../models/invoice/shipment'
require_relative '../models/invoice/shipment_label'
require_relative '../models/invoice/book_shipment_label'
require_relative '../models/invoice/physical_item_shipment_label'
require_relative '../models/invoice/signature_service_shipment_label'
require_relative '../models/invoice/digital_media_shipment_label'

require_relative '../models/customer/credit_card'
require_relative '../models/customer/address'
require_relative '../models/customer/customer'

describe Shipment do
    # happy way for the fluxogram
    before(:each) do
        # Book Example (build new payments if you need to properly test it)
        @customer = Customer.new

    end

    describe "#generate_shipment_label" do

        it "should generate a shipment label on book product" do

            book = Product.new(name: 'Awesome book', type: :book, price: 10)

            billing_address = Address.new('123434', :billing_address)
            shipping_address =  Address.new('123434', :shipping_address)

            book_order = Order.new(@customer, billing_address, shipping_address)

            book_order.add_product(book)

            payment_method = CreditCard.fetch_by_hashed('43567890-987654367')

            payment_book = Payment.new(order: book_order, payment_method: payment_method)

            payment_book.pay

            shipment = Shipment.new(order: book_order)

            shipment.generate_shipment_label

            expect(book.shipment_label.type).to be(:duty_free)

        end

        it "should generate a shipment label for a physical product" do

            chair = Product.new(name: 'Awesome Chair', type: :physical_item, price: 300)

            billing_address = Address.new('123434', :billing_address)
            shipping_address =  Address.new('123434', :shipping_address)

            chair_order = Order.new(@customer, billing_address, shipping_address)

            chair_order.add_product(chair)

            payment_method = CreditCard.fetch_by_hashed('43567890-987654367')

            payment_chair = Payment.new(order: chair_order, payment_method: payment_method)

            payment_chair.pay

            shipment = Shipment.new(order: chair_order)

            shipment.generate_shipment_label

            expect(chair.shipment_label.type).to be(:put_on_box_mailing)

        end

        it "should generate a shipment label for a signature service" do

            signature_service = Product.new(name: 'Cable Digital Signature Service', type: :signature_service, price: 15)

            billing_address = Address.new('123434', :billing_address)
            shipping_address =  Address.new('123434', :shipping_address)

            signature_service_order = Order.new(@customer, billing_address, shipping_address)

            signature_service_order.add_product(signature_service)

            payment_method = CreditCard.fetch_by_hashed('43567890-987654367')

            payment_signature_service = Payment.new(order: signature_service_order, payment_method: payment_method)

            payment_signature_service.pay

            shipment = Shipment.new(order: signature_service_order)

            shipment.generate_shipment_label

            expect(signature_service.shipment_label.type).to be(:activate_signature)

        end

        it "should generate a shipment label for a digital media" do

            digital_media = Product.new(name: 'Cable Digital Signature Service', type: :digital_media, price: 15)

            billing_address = Address.new('123434', :billing_address)
            shipping_address =  Address.new('123434', :shipping_address)

            digital_media_order = Order.new(@customer, billing_address, shipping_address)

            digital_media_order.add_product(digital_media)

            payment_method = CreditCard.fetch_by_hashed('43567890-987654367')

            payment_digital_media = Payment.new(order: digital_media_order, payment_method: payment_method)

            payment_digital_media.pay

            shipment = Shipment.new(order: digital_media_order)

            shipment.generate_shipment_label

            expect(digital_media.shipment_label.type).to be(:digital_media_voucher)

        end

    end
end
