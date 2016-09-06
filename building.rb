class Building
	attr_accessor :address, :apartments

	def initialize(args={})

		@address = args[:address]
		@apartments = args[:apartments]
	end

	def total_room_count
		@apartments.map {|apartment| apartment.room_count}.reduce(:+)
	end

	def total_monthly_revenue
		@apartments.map {|apartment| apartment.monthly_rent}.reduce(:+)
	end

	def apartments_by_rent
		@apartments.sort_by {|apartment| apartment.monthly_rent}.reverse
	end

	def find_apartments_by_bedroom_count(bedroom_count)
		@apartments.select {|apartment| return apartment if apartment.bedroom_count == bedroom_count}
	end

	def total_sqft
		@apartments.map {|apartment| apartment.total_sqft}.reduce(:+)
	end
end
