class Building
  attr_reader :address, :apartments
  def initialize(args={})
    @address = args.fetch(:address,nil)
    @apartments = args.fetch(:apartments,[])
  end

  def total_room_count
    apartments.map { |apartment| apartment.rooms.count }.reduce(:+)
  end

  def total_monthly_revenue
    apartments.map { |apartment| apartment.monthly_rent }.reduce(:+)
  end

  def apartments_by_rent
    apartments.sort { |a,b| b.monthly_rent <=> a.monthly_rent }
  end

  def find_apartments_by_bedroom_count(count)
    apartments.find { |apartment| apartment.bedroom_count == count }
  end

  def total_sqft
    apartments.map { |apartment| apartment.total_sqft }.reduce(:+)
  end
end
