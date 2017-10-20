require 'spec_helper'

require_relative '../models/customer/address'

describe Address do
    describe "creation of the customer address" do

        it "shoud if it is a billing address type" do

            billing_address = Address.new('123434', :billing_address)

            expect(billing_address.type).to be(:billing_address)
        end

        it "shoud test if it is a shipping address type" do

            shipping_address =  Address.new('123434', :shipping_address)

            expect(shipping_address.type).to be(:shipping_address)
        end
    end
end
