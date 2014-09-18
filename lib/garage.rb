require_relative 'bike_container'

class Garage
	include BikeContainer
	def initialize(option={})
		self.capacity = option.fetch(:capacity, capacity)
	end
end