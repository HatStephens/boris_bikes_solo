require_relative 'bike_container'


class Garage
	include BikeContainer
	def initialize(option={})
		self.capacity = option.fetch(:capacity, capacity)
	end

	def fetch_and_fix(van)
		van.bikes.each do |bike|
			van.release(bike)
			self.dock(bike.fix!)
		end
	end
end