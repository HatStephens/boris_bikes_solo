require_relative 'bike'

module BikeContainer
	
	attr_reader :bikes

	def initialize
		@bikes = []
	end

	# def bikes
	# 	@bikes
	# end

	def bike_count
		@bikes.length
	end

	def dock(bike)
	 	@bikes << bike
	end
end