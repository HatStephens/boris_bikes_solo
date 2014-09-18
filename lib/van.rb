require_relative 'bike_container'

class Van
	include BikeContainer

	def initialize(option={})
		self.capacity = option.fetch(:capacity, capacity)
	end

	def collect_broken_bikes(station)
		station.broken_bikes.each do |bike|
			bikes << bike
			station.release(bike)
		end
	end

end