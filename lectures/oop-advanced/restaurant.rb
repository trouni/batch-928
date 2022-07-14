require_relative 'chef'

class Restaurant
  attr_reader :name, :location, :capacity, :category, :chef

  def self.categories
    %w[japanese burgers modern_british mexican italian]
  end

  def initialize(name, location, capacity, category, chef_name = nil)
    # STATE
    @name = name # string
    @location = location # string
    @capacity = capacity # integer
    @category = category # string
    @chef = Chef.new(chef_name, self) if chef_name # instance of Chef
    @reservations = []
  end

  # BEHAVIOUR
  def open?
    Time.now.hour >= 11 && Time.now.hour < 14
  end

  def make_reservation(customer_name)
    @reservations << customer_name
    puts "Reservation made for #{customer_name} at #{name}."
  end

  def print_reservations
    puts '=' * 30
    puts "These are the current reservations for #{name}:"
    @reservations.each do |customer_name|
      puts "- #{customer_name}"
    end
    puts '=' * 30
  end
end
