class Apartment
	attr_accessor :number, :rooms, :monthly_rent

	def initialize(args={})

		@number = args[:number]
		@rooms = args[:rooms]
		@monthly_rent = args[:monthly_rent] || 1000
	end

	def total_sqft
		@rooms.map {|room| room.sqft}.reduce(:+)
	end

	def price_per_sqft
		@monthly_rent/(total_sqft).to_f
	end

	def room_count
		@rooms.count
	end

	def bedroom_count
		@rooms.select {|room| room.name == 'bedroom'}.count
	end
end
