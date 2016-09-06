class Apartment

  attr_reader :number
  attr_accessor :rooms, :monthly_rent

  def initialize(args={})
    @number = args.fetch(:number, "")
    @rooms = args.fetch(:rooms, "")
    @monthly_rent = args.fetch(:monthly_rent, 1000)
  end

  def total_sqft
    area = @rooms.map { |room| room.sqft }
    area.reduce(:+)
  end

  def price_per_sqft
    @monthly_rent / total_sqft.to_f
  end

  def room_count
    @rooms.length
  end

  def bedroom_count
    bedrooms = @rooms.select { |room| room.name == "bedroom"}
    bedrooms.length
  end
end
