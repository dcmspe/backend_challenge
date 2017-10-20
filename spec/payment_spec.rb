require 'spec_helper'

require_relative '../models/invoice/product'
require_relative '../models/invoice/order'
require_relative '../models/invoice/invoice'
require_relative '../models/invoice/payment'

require_relative '../models/customer/credit_card'
require_relative '../models/customer/address'
require_relative '../models/customer/customer'

describe Payment do
    # happy way for the fluxogram
    before(:each) do
        # Book Example (build new payments if you need to properly test it)
        @customer = Customer.new

    end

    describe "Payment methods" do

        it "should make a invoice for a book" do

            book = Product.new(name: 'Awesome book', type: :book, price: 10)

            billing_address = Address.new('123434', :billing_address)
            shipping_address =  Address.new('123434', :shipping_address)

            book_order = Order.new(@customer, billing_address, shipping_address)

            book_order.add_product(book)

            payment_method = CreditCard.fetch_by_hashed('43567890-987654367')

            payment_book = Payment.new(order: book_order, payment_method: payment_method)

            payment_book.pay

            expect(!payment_book.invoice.nil?).to be(true)

        end

        it "should make a payment" do
            book = Product.new(name: 'Awesome book', type: :book, price: 10)

            billing_address = Address.new('123434', :billing_address)
            shipping_address =  Address.new('123434', :shipping_address)

            book_order = Order.new(@customer, billing_address, shipping_address)

            book_order.add_product(book)

            payment_method = CreditCard.fetch_by_hashed('43567890-987654367')

            payment_book = Payment.new(order: book_order, payment_method: payment_method)

            payment_book.pay

            expect(payment_book.paid?).to be(true)

        end
    end
end
