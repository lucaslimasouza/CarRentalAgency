# enconding: utf-8

require 'test/unit'
require 'minitest/mock'
require_relative '../model/car/Car'
require_relative '../model/car/Unrented'
require_relative '../model/car/Rented'
require_relative '../model/Customer'

class CarTest < Test::Unit::TestCase

	def test_new_car
		assert_not_nil @herbie, "shouldn't be nil"
		assert_equal "hji1030", @herbie.license_plate, "should have license plate = hji1030"
		assert_equal "HATCH", @herbie.category, "should have category = HATCH"
		assert_nil @herbie.driver, "should return nil to driver"
		@category.verify
	end

	def test_rent_car
		@herbie.rent! @driver
		assert_equal true, @herbie.is_rented?, "should return true"
		assert_equal "Lucas", @herbie.driver.name, "should return Lucas"
	end

	def test_unrent_car
		@herbie.rent! @driver
		@herbie.unrent!
		assert_equal false, @herbie.is_rented?, "should return false"
		assert_nil @herbie.driver, "the driver should be nobody"
	end

	def setup
		@category = MiniTest::Mock.new
		@category.expect(:at,"HATCH",[":hatch"])
		@herbie = Car.new :license_plate => "hji1030", :category => @category.at(":hatch")
		@driver = Customer.new :name =>"Lucas",:phone => "1234",:license =>"12345"

	end
end
