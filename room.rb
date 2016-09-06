class Room
	attr_accessor :name
	attr_reader :sqft, :window_count

	def initialize(args={})
		@name = args.fetch(:name) { "bedroom" }
		@sqft = args.fetch(:sqft) { 120 }
		@window_count = args.fetch(:window_count) { 0 } # Check if default value should be 0
	end


end
