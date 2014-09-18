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
<<<<<<< HEAD
		@bikes.count
	end

	def dock(bike=nil)
		raise "This is not a bike." if !bike.is_a? Bike
	 	@bikes << bike
	end

	def release(bike)
		@bikes.delete(bike)
	end
=======
		@bikes.length
	end

	def dock(bike)
	 	@bikes << bike
	end
>>>>>>> 1415f9deae40747b6bc1d9d36b79b79542aba703
end