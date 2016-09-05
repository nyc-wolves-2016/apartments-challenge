class Room

  attr_reader :total_sqft
  attr_accessor :name

  def initialize(args={})
    @name = args.fetch(:name, 'bedroom')
    @total_sqft = args.fetch(:sqft, 120)
  end

end
