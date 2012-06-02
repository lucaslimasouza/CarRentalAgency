# encoding: utf-8

require 'test/unit'
require 'minitest/mock'
require_relative '../model/agency/plan/Hatch'
require_relative '../model/agency/plan/Seda'
require_relative '../model/agency/plan/Pickup'
require_relative '../model/agency/plan/Comercial'

class PlansAgencyTest <Test::Unit::TestCase

	def test_budget_plan_hatch
		asserts_to_all_plans :plan => Hatch.new, :response => 179.80, :period => 2
	end

	def test_budget_plan_seda
		asserts_to_all_plans :plan => Seda.new, :response => 685.80, :period =>6
	end

	def test_budget_plan_pickup
		asserts_to_all_plans :plan => Pickup.new, :response => 1570.10, :period =>7
	end

	def test_budget_plan_comercial
		asserts_to_all_plans :plan => Comercial.new, :response => 723.90, :period =>3
	end


	def asserts_to_all_plans(args)
		assert_not_nil args[:plan]
		assert_equal args[:response],args[:plan].calculate(args[:period]), "should return #{args	[:response]}"
	end
end
