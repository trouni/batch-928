require_relative 'restaurant'

class FastFoodRestaurant < Restaurant
  attr_reader :prep_time

  def initialize(name, location, capacity, category, prep_time)
    super(name, location, capacity, category)
    @prep_time = prep_time # integer (in minutes)
  end

  def open?
    super || Time.now.hour >= 18 && Time.now.hour < 24
  end

  def make_reservation(customer_name)
    puts "Sorry #{customer_name}, this is a fast food, we don't take reservations at #{name}..."
  end
end
