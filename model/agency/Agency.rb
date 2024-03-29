# encoding: utf-8

class Agency

	def initialize (name, budgets)
		@name = name
		@budgets = budgets
	end

	def name
		@name
	end

	def budget(data)
		@budgets[data[:of].category].calculate data[:period]
	end

	def check_in_rent(data)
		data[:car].rent! data[:to]
		data[:car]
	end
end
