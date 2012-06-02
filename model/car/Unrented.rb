#enconding: urf-8

require_relative 'Rented'

class Unrented

	def rent!(car, driver)
		car.driver = driver
		car.currenty_state = Rented.new
	end

	def unrent!(car, driver)
		puts "It's already unrented'"
	end
end
