# encoding: utf-8

require 'test/unit'
require 'minitest/mock'
require_relative '../model/agency/Agency'
require_relative '../model/car/Car'

class AgencyTest <Test::Unit::TestCase

	def test_new_agency
		assert_not_nil(@agency)
		assert_equal("RentalCar",@agency.name, "Should return a name = RentalCar")
	end

	def test_budget_rent_of_hatch
		@car.expect(:category, "HATCH")
		budget = @agency.budget  :of => @car, :period => 2
		assert_equal(179.80,budget, "Should have a budget with value = 179.80")
		@car.verify
	end

	def test_budget_rent_of_seda
		@car.expect(:category, "SEDA")
		budget = @agency.budget :of => @car, :period => 6
		assert_equal(685.80,budget, "Should have a budget with value = 685.80")
		@car.verify
	end

	def test_budget_rent_of_pickup
		@car.expect(:category, "PICKUP")
		budget = @agency.budget :of => @car, :period => 7
		assert_equal(1570.10, budget, "should return a budget with value = 1570.10")
		@car.verify
	end

	def test_budget_rent_of_comercial
		@car.expect(:category, "COMERCIAL")
		budget = @agency.budget :of => @car, :period => 3
		assert_equal(723.90, budget, "should return a budget with value = 723.90")
		@car.verify
	end

	def test_check_in_to_rent
		@car_checked = @agency.check_in_rent(:to => @driver,:car => @herbie)
		assert_equal "Lucas", @car_checked.driver.name, "should return driver as Lucas"
		@driver.verify
	end

	def builder_rent_plans_with_mocks
		@rent_plans = Hash.new
		@rent_plans["HATCH"] = builder_mock_plan :response => 179.80, :period => 2
		@rent_plans["SEDA"] = builder_mock_plan :response => 685.80, :period => 6
		@rent_plans["PICKUP"] = builder_mock_plan :response => 1570.10, :period => 7
		@rent_plans["COMERCIAL"] = builder_mock_plan :response => 723.90, :period => 3
		@rent_plans
	end

	def builder_mock_plan(data)
		MiniTest::Mock.new.expect(:calculate, data[:response],[data[:period]])
	end

	def builder_mock_cars
		@cars = Array.new
		@car = MiniTest::Mock.new
	end

	def build_car_to_check
		@category = MiniTest::Mock.new
		@category.expect(:at,"HATCH",[":hatch"])
		@herbie = Car.new :license_plate => "hji1030", :category => @category.at(":hatch")
	end

	def setup
		@rent_plans = builder_rent_plans_with_mocks
		@agency = Agency.new("RentalCar",@rent_plans)
		@driver = MiniTest::Mock.new
		@driver.expect(:name,"Lucas")
		@car = MiniTest::Mock.new
		build_car_to_check
	end
end
