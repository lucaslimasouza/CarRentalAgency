# encoding: utf-8

class Customer

	def initialize (data)
		@name = data[:name]
		@phone = data[:phone]
		@drive_license = data[:license]

	end

	def name
		@name
	end

	def phone
		@phone
	end

	def drive_license
		@drive_license
	end

end
