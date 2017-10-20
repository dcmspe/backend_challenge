require 'spec_helper'

require_relative '../models/invoice/order'

describe Order do
    before(:each) do
        # Book Example (build new payments if you need to properly test it)
        @customer = Customer.new

    end

    describe "#total_amount" do
       it "should return the total amout of an order" do
         cool_book = Product.new(name: 'Cool book', type: :book, price: 30)
         not_so_cool_book = Product.new(name: 'Not so cool book', type: :book, price: 10)

         billing_address = Address.new('123434', :billing_address)
         shipping_address =  Address.new('123434', :shipping_address)

         book_order = Order.new(@customer, billing_address, shipping_address)

         book_order.add_product(cool_book)
         book_order.add_product(not_so_cool_book)

         expect(book_order.total_amount).to be(40)
       end
    end

end
