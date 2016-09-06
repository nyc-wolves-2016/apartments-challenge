require_relative 'square_footage'
class Building
  attr_reader :apartments

  include SquareFootage
  def initialize(args = {})
    @address = args.fetch(:address, nil)
    @apartments = args.fetch(:apartments, [])
  end

  def collection_of_rooms
    self.apartments.map { |apartment| apartment.rooms }.flatten
  end

  def total_room_count
    self.apartments.inject(0) { |sum, apartment| sum + apartment.room_count}
  end

  def total_monthly_revenue
    self.apartments.inject(0) { |sum, apartment| sum + apartment.monthly_rent}
  end

  def apartments_by_rent
    apartments.sort { |a,b| b.monthly_rent <=> a.monthly_rent }
  end

  def find_apartments_by_bedroom_count(num)
    possible_apts = self.apartments.select do |apartment|
      apartment.bedroom_count == num
    end
    possible_apts.each { |apt| return apt }
  end
end
