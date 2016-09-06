class Building
attr_reader :apartments
attr_accessor :address

  def initialize (args={})
    @apartments = args.fetch(:apartments)
    @address = args.fetch(:address)
  end

  def total_room_count
    apartments.inject(0) { |sum, apt| sum + apt.room_count }
  end

  def total_monthly_revenue
    apartments.inject(0) { |sum, apt| sum + apt.monthly_rent }
  end

  def apartments_by_rent
    apartments.sort_by { |apt| apt.monthly_rent }.reverse
  end

  def find_apartments_by_bedroom_count(num)
    apartments.find { |apt| apt.bedroom_count == num }
  end

  def total_sqft
    apartments.inject(0) { |sum, apt| sum + apt.total_sqft }
  end
end
