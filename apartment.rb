require_relative 'total_sqft'

class Apartment
  include TotalSquareFeet

  attr_reader :rooms, :monthly_rent
  def initialize(args={})
    @number = args[:number]
    @monthly_rent = args.fetch(:monthly_rent, 1000)
    @rooms = args[:rooms]
  end

  def room_count
    @rooms.length
  end

  def contained_areas
    self.rooms
  end

  def price_per_sqft
    self.monthly_rent / total_sqft.to_f 
  end

  def bedroom_count
    @rooms.select { |room| room.name == 'bedroom'}.length
  end

end
