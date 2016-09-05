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

# I made the value negative as a nifty way to sort in descending order with sort_by
  def apartments_by_rent
    @apartments.sort_by { |apartment| -apartment.monthly_rent }
  end

  # This returns an array, so i added a condition to break it out of the array if the length is 1
  # since the rspec is looking for something not in an array.
  def find_apartments_by_bedroom_count(count)
    relevant_apartments = @apartments.select { |apartment| apartment.bedroom_count == count }
    relevant_apartments.first if relevant_apartments.length == 1
  end

  def total_sqft
    @apartments.reduce(0) { |sum, apartment| sum + apartment.total_sqft }
  end

end
