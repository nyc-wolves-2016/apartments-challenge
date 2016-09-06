class Building

	attr_reader :apartments

	def initialize(args={})
		@apartments = args.fetch(:apartments, "")
	end

	def total_room_count
		apartments.map {|apartment| apartment.room_count}.reduce(:+)
	end

	def total_monthly_revenue
		apartments.map {|apartment| apartment.monthly_rent}.reduce(:+)
	end

	def apartments_by_rent
		apartments.sort_by {|apartment| apartment.monthly_rent}.reverse
	end

	def find_apartments_by_bedroom_count(num)
		apartments.find {|apartment| apartment.bedroom_count == num}
	end

	def total_sqft
		apartments.map {|apartment| apartment.total_sqft}.reduce(:+)
	end
end
