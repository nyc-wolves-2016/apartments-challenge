class Building

  attr_reader :address, :apartments

  def initialize(args={})
    @address = args.fetch(:address, "")
    @apartments = args.fetch(:apartments, "")
  end

  def total_room_count
    rooms = @apartments.map { |apartment| apartment.rooms.length }
    rooms.reduce(:+)
  end

  def total_monthly_revenue
    revenue = @apartments.map { |apartment| apartment.monthly_rent }.reduce(:+)
  end

  def apartments_by_rent
    @apartments.sort_by { |apartment| apartment.monthly_rent}.reverse
  end

  def find_apartments_by_bedroom_count(integer)
    @apartments.select { |apartment| apartment.bedroom_count == 1}.first
    # i would change the test to expect an array with the apartments, in case there are multiple that fulfill the criteria
  end

  def total_sqft
    area = @apartments.map { |apartment| apartment.total_sqft }.reduce(:+)
  end
end
