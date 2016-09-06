class Apartment
	attr_reader :rooms, :monthly_rent

	def initialize(args={})
		@number = args.fetch(:number, nil)
		@rooms = args.fetch(:rooms, nil)
		@monthly_rent = args.fetch(:monthly_rent, 1000)
	end

	def total_sqft
		@rooms.inject(0) { |total, room| total + room.sqft }
	end

	def price_per_sqft
		monthly_rent / total_sqft.to_f
	end

	def room_count
		@rooms.count
	end

	def bedroom_count
		@rooms.select { |room| room.name == 'bedroom' }.count
	end

end
