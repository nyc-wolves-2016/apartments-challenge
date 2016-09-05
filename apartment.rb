class Apartment
  attr_reader :rooms, :monthly_rent
  def initialize(args={})
    @number = args[:number]
    @monthly_rent = args.fetch(:monthly_rent, 1000)
    @rooms = args[:rooms]
  end

  def room_count
    @rooms.length
  end

  def total_sqft
    @rooms.reduce(0) { |sum, room| sum + room.sqft }
  end

  def price_per_sqft
    self.monthly_rent / total_sqft.to_f 
  end

  def bedroom_count
    0
  end

end
