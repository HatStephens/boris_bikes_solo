require_relative 'bike_container'

class Van
	include BikeContainer

	def initialize(option={})
		self.capacity = option.fetch(:capacity, capacity)
	end

	def collect_broken_bikes(station)
		station.broken_bikes.each do |bike|
			dock(bike)
			station.release(bike)
		end
	end

	def collect_fixed_bikes(garage)
		garage.bikes.each do |bike|
			dock(bike)
			garage.release(bike)
		end
	end

end