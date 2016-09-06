class Room

	attr_accessor :name
	attr_reader :sqft

	def initialize(args={})
		@sqft = args.fetch(:sqft, 120)
		@name = args.fetch(:name, 'bedroom')
	end

end
