class Apartment

	attr_reader :rooms, :number, :monthly_rent

	def initialize(args={})
		@rooms = args.fetch(:rooms, 'blah')
		@number = args.fetch(:number, '10#6')
		@monthly_rent = args.fetch(:monthly_rent, 1000)
	end

	def total_sqft
		rooms.reduce(0) { |sum, room| sum + room.sqft }
	end

	def price_per_sqft
		monthly_rent / total_sqft.to_f
	end

	def room_count
		rooms.length
	end

	def bedroom_count
		rooms.count { |room| room.name == 'bedroom' }
	end

end
