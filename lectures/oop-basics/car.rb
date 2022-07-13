class Car # UpperCamelCase
  attr_reader :brand#, :color # defined in the accessor
  ## is equivalent to defining these methods:
  # def color
  #   @color
  # end
  #
  # def brand
  #   @brand
  # end
  ##

  # attr_writer :color # defined in the accessor
  ## is equivalent to defining this method:
  # def color=(new_color)
  #   @color = new_color
  # end
  ##

  attr_accessor :color # creates both the reader and the writer
  ## is equivalent to defining these methods:
  # attr_reader :color
  # attr_writer :color
  ##

  def initialize(color, brand = 'Audi') # constructor
    # This runs when you call Car.new

    # We define the initial STATE/DATA of our instance
    # @variables are instance variables
    @color = color # string
    @brand = brand # string
    @started = false # boolean
    # These instance variables are encapsulated inside the instance
  end

  # BEHAVIOUR

  # instance methods
  def start!
    crank_engine
    inject_fuel
    spark_plugs

    @started = true
  end

  # custom attribute reader
  def started?
    @started
  end

  # attribute writer

  # def paint(new_color)
  #   @color = new_color
  # end

  # def color=(new_color)
  #   @color = new_color
  # end

  private

  def crank_engine
    puts "Cranking the engine..."
  end

  def inject_fuel
    puts "Injecting fuel..."
  end

  def spark_plugs
    puts "Sparking plugs..."
  end
end

malene = Car.new('green', 'Audi')
koki = Car.new('red', 'Benz')

puts "Malene's car is a #{malene.color} #{malene.brand}."

puts "Malene's car engine is #{malene.started? ? 'on' : 'off'}."
puts "Starting Malene's car..."
malene.start!
puts "Malene's car engine is now #{malene.started? ? 'on' : 'off'}."

puts "Painting Malene's car yellow..."
malene.color = 'yellow'
# malene.paint('yellow')
puts "Malene's car is now a #{malene.color} #{malene.brand}."