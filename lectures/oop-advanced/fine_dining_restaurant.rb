require_relative 'restaurant'

class FineDiningRestaurant < Restaurant
  attr_reader :stars

  def initialize(name, location, capacity, category, stars)
    super(name, location, capacity, category)
    @stars = stars # integer
  end

  def print_reservations
    puts '=' * 30
    puts "Our reservations are private"
    puts '=' * 30
  end
end
