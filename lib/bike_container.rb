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
		@bikes.count
	end

	def dock(bike=nil)
		raise "This is not a bike." if !bike.is_a? Bike
	 	@bikes << bike
	end

	def release(bike)
		@bikes.delete(bike)
	end

end