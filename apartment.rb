require_relative 'square_footage'
require_relative 'room_counter'


class Apartment
	include SquareFootage
	include RoomCounter

	attr_accessor :number, :monthly_rent
	attr_reader :rooms

	def initialize(args = {})
		@rooms = args.fetch(:rooms, [])
		@monthly_rent = args.fetch(:monthly_rent, 1000)
		@number = args.fetch(:number, nil)
	end

	# def total_sqft
	# 	rooms.inject(0) { |sum, room| sum + room.sqft }
	# end

	def price_per_sqft
		monthly_rent.to_f / total_sqft
	end

	def room_count
		total_room_count
	end

	def bedroom_count
		rooms.count do |room| 
			room.name == "bedroom"
		end
	end

	def group_of_rooms
		rooms.flatten
	end

end
