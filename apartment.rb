class Apartment

  attr_reader :rooms, :monthly_rent

  def initialize(args={})
    @number = args.fetch(:number, '')
    @rooms = args.fetch(:rooms, [])
    @monthly_rent = args.fetch(:monthly_rent, 1000)
  end

  def total_sqft
    rooms.reduce(0) { |total, room| total + room.sqft }
  end

  def price_per_sqft
    monthly_rent / total_sqft.to_f 
  end

  def room_count
    rooms.count 
  end

  def bedroom_count
    rooms.count { |room| room.name == 'bedroom' }
  end

end
