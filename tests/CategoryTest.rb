# encoding: utf-8

require 'test/unit'
require_relative '../model/car/Category'

class CategoryTest < Test::Unit::TestCase

	def test_new_category
		assert_not_nil @category, "shouldn't not be nil'"
	end

	def test_array_categories
		assert_equal Hash.new, @category.types, "should be an empty Hash"
	end

	def test_add_category
		@category.add :symbol => ":hatch", :value => "HATCH"
		@category.add :symbol => ":seda", :value => "SEDA"
		assert_equal "HATCH", @category.at(":hatch"), "should return an HATCH category"
		assert_equal "SEDA", @category.at(":seda"), "should return an SEDA category"
	end

	def setup
		@category = Category.new
	end

end
