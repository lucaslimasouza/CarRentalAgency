# enconding: utf-8
require 'minitest/mock'
require_relative 'Unrented'

class Car

	def initialize(data)
		@license_plate = data[:license_plate]
		@category = data[:category]
		@driver = nil
		@currenty_state = Unrented.new
	end

	def license_plate
		@license_plate
	end

	def category
		@category
	end

	def rent!(driver)
		@currenty_state.rent! self, driver
	end

	def unrent!
		@currenty_state.unrent! self, driver
	end

	def is_rented?
		unless @driver == nil then true else false end
	end

	def driver
		@driver
	end

	def driver=(driver)
		@driver = driver
	end

	def currenty_state=(new_state)
		@currenty_state = new_state
	end
end
