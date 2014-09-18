class DockingStation
	include BikeContainer

	def initialize(option = {})
		self.capacity=option.fetch(:capacity, capacity)
	end

end