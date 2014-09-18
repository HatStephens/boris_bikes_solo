require_relative 'bike_container'

class Van
	include BikeContainer


	def collect_broken_bikes(station)
		station.broken_bikes.each do |bike|
			bikes << bike
			station.release(bike)
		end
	end

end