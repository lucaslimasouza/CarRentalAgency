#enconding: utf-8

require_relative 'Unrented'

class Rented

	def rent!(car, driver)
		puts "It's already unrented"

	end

	def unrent!(car, driver)
		car.driver = nil
		car.currenty_state = Unrented.new
	end

end
