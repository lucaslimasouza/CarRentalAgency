# encoding: utf-8

require 'test/unit'
require_relative '../model/Customer'


class CustomerTest < Test::Unit::TestCase

	def test_new_customer
		lucas = Customer.new :name =>"Lucas",:phone => "1234",:license =>"12345"
		assert_not_nil lucas, "should be a new Customer object"
		assert_equal "Lucas", lucas.name, "should have name = Lucas"
		assert_equal "1234", lucas.phone, "should have phone = 1234"
		assert_equal "12345", lucas.drive_license, "should have number's drive license = 12345"
	end

end
