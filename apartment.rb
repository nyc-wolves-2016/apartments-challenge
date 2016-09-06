class Apartment
  attr_reader :number, :rooms, :monthly_rent

  def initialize(args={})
    @number = args.fetch(:number, "")
    @rooms = args.fetch(:rooms, "")
    @monthly_rent = args.fetch(:monthly_rent, "") {1000}
  end 

  def total_sqft
    total_sqft = []
    @rooms.each do |room|
      total_sqft << room.sqft
    end  
    total_sqft.reduce(:+)
  end   

  def price_per_sqft
    @monthly_rent / total_sqft.to_f
  end 

  def room_count
    @rooms.length
  end  

  def bedroom_count
    @rooms.find_all {|room| room.name == 'bedroom'}.count
  end 
end


  # describe '#bedroom_count' do
  #     it 'return number of bedroom' do
  #       expect(apartment.bedroom_count).to eq 0
  #     end


# first_room= {Room.new(name: 'kitchen', sqft: 120, window_count: rand(0..2))}
# second_room = {Room.new(name: 'lounge', sqft: 380, window_count: rand(0..2))}

# generate_rooms = [first_room, second_room]

# apartment = { Apartment.new(number: '10#7', rooms: generate_rooms, monthly_rent: 1450) }