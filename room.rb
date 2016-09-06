require_relative 'square_footage'
require_relative 'room_counter'

class Room
	include SquareFootage
	include RoomCounter

	attr_reader :sqft, :window_count
	attr_accessor :name 

	def initialize(args = {})
    @name = args[:name] || 'bedroom'
    @sqft = args.fetch(:sqft, 120)
    @window_count = args.fetch(:window_count, rand(0..2))
  end

  def group_of_rooms
  	[self].flatten
  end


end
