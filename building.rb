class Building
  attr_reader :address, :apartments

  def initialize(args={})
    @address = args.fetch(:address)
    @apartments = args.fetch(:apartments)
  end

  def total_room_count
    @apartments.reduce(0) { |sum, apartments| sum + apartments.room_count }
  end

  def total_monthly_revenue
    @apartments.reduce(0) { |sum, apartments| sum + apartments.monthly_rent }
  end
end
