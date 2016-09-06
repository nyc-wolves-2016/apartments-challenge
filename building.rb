class Building
	attr_reader :address, :apartments

	def initialize(args={})
		@address = args.fetch(:address)
		@apartments = args.fetch(:apartments)
	end

	def total_room_count
		@apartments.inject(0) { |room_total, apartment| room_total + apartment.room_count }
	end

	def total_monthly_revenue
		@apartments.inject(0) { |revenue_total, apartment| revenue_total + apartment.monthly_rent }
	end

	def find_apartments_by_bedroom_count(desired_bedroom_count)
		apartment_matches = @apartments.select { |apartment| apartment.bedroom_count == desired_bedroom_count }
		apartment_matches.first if apartment_matches.count == 1
	end

	def apartments_by_rent
		@apartments.sort_by { |apartment| -apartment.monthly_rent }
	end

	def total_sqft
		@apartments.inject(0) { |sqft_total, apartment| sqft_total + apartment.total_sqft }
	end

end
