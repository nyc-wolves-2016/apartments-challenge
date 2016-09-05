# Here is a dedicated module for the shared behavior of the building and apartment classes
module TotalSquareFeet

   def total_sqft
    self.contained_areas.reduce(0) { |sum, area| sum + area.total_sqft }
   end

end