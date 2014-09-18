require_relative 'bike'

module BikeContainer
	
	DEFAULT_CAPACITY = 10

	attr_writer :capacity

	def bikes
		@bikes ||= []
	end

	# def bikes
	# 	@bikes
	# end

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def bike_count
		bikes.count
	end

	def dock(bike=nil)
		raise "This is not a bike." if !bike.is_a? Bike
		raise "Cannot dock because I am full." if full?
	 	bikes << bike
	end

	def release(bike)
		bikes.delete(bike)
	end

	def available_bikes
		bikes.reject { |bike| bike.broken? }
	end

	def broken_bikes
		bikes.select { |bike| bike.broken? }
	end

	def full?
		capacity == bike_count
	end

end