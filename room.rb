class Room
	attr_accessor :name, :sqft, :window_count

	def initialize(args={})
		# args = defaults.merge(args)
		@name = args[:name] || 'bedroom'
		@sqft = args[:sqft] || 120
		@window_count = args[:window_count]
	end

end
