class Building
	attr_reader :apartments

	def initialize(args)
		@address = args.fetch(:address)
		@apartments = args.fetch(:apartments)
	end

	def total_room_count
		self.apartments.inject(0) { |total, apts| total + apts.room_count }
	end

	def total_monthly_revenue
		self.apartments.inject(0) { |total, apts| total + apts.monthly_rent }
	end

	def apartments_by_rent
		self.apartments.sort {|apt1, apt2| apt2.monthly_rent <=> apt1.monthly_rent }
	end

	def find_apartments_by_bedroom_count(num)
		self.apartments.find {|apt| apt.bedroom_count == num }
	end

	def total_sqft
		self.apartments.inject(0) { |total, apts| total + apts.total_sqft }
	end

end
