class Room
  attr_reader :sqft
  attr_accessor :name

  def initialize(args = {})
    @name = args[:name] || "bedroom"
    @sqft = args.fetch(:sqft, 120)
    @window_count = args.fetch(:window_count, rand(0..2))
  end

end
