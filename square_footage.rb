module SquareFootage
	def total_sqft
		group_of_rooms.inject(0) { |sum, room| sum + room.sqft }
	end
end