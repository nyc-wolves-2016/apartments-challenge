class Building

	attr_reader :apartments, :address

	def initialize(args={})
		@apartments = args.fetch(:apartments)
		@address = args.fetch(:address)
	end

	def total_room_count
		apartments.reduce(0) { |sum, apt| sum + apt.room_count }
	end

	def total_monthly_revenue
		apartments.reduce(0) { |rev, apt| rev + apt.monthly_rent }
	end

	def apartments_by_rent
		apartments.sort_by { |apt| -apt.monthly_rent }
	end

	def find_apartments_by_bedroom_count(x)
		apartments.find { |apt| apt.bedroom_count == x }
	end

	def total_sqft
		apartments.reduce(0) { |sum, apt| sum + apt.total_sqft }
	end
end
