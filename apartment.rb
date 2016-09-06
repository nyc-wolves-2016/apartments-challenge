require_relative 'square_footage'

class Apartment
  include SquareFootage
  attr_reader :rooms, :monthly_rent, :number


  def initialize(args = {})
    @rooms = args.fetch(:rooms, [])
    @number = args.fetch(:number, nil)
    @monthly_rent = args.fetch(:monthly_rent, 1000)
  end

  def collection_of_rooms
    self.rooms
  end

  def price_per_sqft
    self.monthly_rent.to_f / total_sqft
  end

  def room_count
    self.rooms.length
  end

  def bedroom_count
    rooms.count { |room| room.name == 'bedroom'}
  end
end
