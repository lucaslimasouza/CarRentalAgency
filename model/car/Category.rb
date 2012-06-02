# encoding: utf-8

class Category

	def initialize
		@types = Hash.new
	end

	def types
		@types
	end

	def add (data)
		@types[data[:symbol]] = data[:value]
	end

	def at (symbol)
		@types[symbol]
	end

end
