require_relative 'room'
require_relative 'apartment'
require 'pry'

class Building
	attr_reader :address
	attr_accessor :apartments
	def initialize(args = {})
		@address = args.fetch(:address,"")
		@apartments = args.fetch(:apartments,[])
	end

	def total_room_count
		apartments.reduce(0) { |sum, apt| sum + apt.room_count }
	end

	def total_monthly_revenue
		apartments.reduce(0) { |sum, apt| sum + apt.monthly_rent}
	end

	def apartments_by_rent
		apartments.sort_by{|apt| -apt.monthly_rent}
	end

	def find_apartments_by_bedroom_count(num)
		apartments.select {|apartment| apartment.bedroom_count == num}
	end

	def total_sqft
		apartments.reduce(0) { |sum, apt| sum + apt.total_sqft}
	end

end
