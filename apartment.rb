class Apartment
	attr_reader :rooms, :monthly_rent

	def initialize(args={})
		@rooms = args.fetch(:rooms, [])
		@number = args.fetch(:number, nil)
		@monthly_rent = args.fetch(:monthly_rent, 1000)
	end

	def total_sqft
		self.rooms.inject(0) { |total, room| total + room.sqft }
	end

	def price_per_sqft
		self.monthly_rent/self.total_sqft.to_f
	end

	def room_count
		self.rooms.length
	end

	def bedroom_count
		self.rooms.count { |room| room.name == 'bedroom' }
	end


end
