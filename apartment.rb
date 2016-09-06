require_relative 'room'
require 'pry'

class Apartment
	attr_reader :number, :rooms, :monthly_rent
	attr_accessor :total_sqft
	def initialize(args = {})
		@number = args.fetch(:number, 0)
		@rooms = args.fetch(:rooms, [])
		@monthly_rent = args.fetch(:monthly_rent, 1000)
		@total_sqft = 0
	end

	def generate_rooms
		@rooms << Room.new
	end

	def total_sqft
		@rooms.each {|room| @total_sqft += room.sqft}
		@total_sqft
	end


	def price_per_sqft
		monthly_rent/ total_sqft.to_f
	end

	def room_count
		@rooms.length
	end

	def bedroom_count
		@rooms.count {|room| room.name == 'bedrooom'}
	end
end
