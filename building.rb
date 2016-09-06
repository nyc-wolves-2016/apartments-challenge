require_relative 'square_footage'
require_relative 'room_counter'
require 'pry'

class Building
	include SquareFootage
	include RoomCounter
	
	attr_reader :apartments, :address

	def initialize(args = {})
		@address = args.fetch(:address, nil)
		@apartments = args.fetch(:apartments, [])
	end

	# def total_room_count
	# 	apartments.inject(0) { |sum, apartment| sum + apartment.room_count }
	# end

	def total_monthly_revenue
		apartments.inject(0) { |sum, apartment| sum + apartment.monthly_rent }
	end

	def apartments_by_rent
		apartments.sort { |a,b| b.monthly_rent <=> a.monthly_rent }
	end
	
	def find_apartments_by_bedroom_count(num)
		results = apartments.find_all { |apartment| apartment.bedroom_count == num }		
		return results[0] if results.count < 2
	end

	# def total_sqft
	# 	total_rooms =apartments.map { |apartment| apartment.rooms }.flatten
	# 	total_rooms.inject(0) { |sum, room| sum + room.sqft }
	# end

	def group_of_rooms
		apartments.map { |apartment| apartment.rooms }.flatten
	end
end
