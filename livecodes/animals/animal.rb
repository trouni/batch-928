class Animal
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def self.phyla
    [
      'the worms',
      'the molluscs',
      'the sea cucumbers',
      'the ones with the back end'
    ]
  end

  def eat(food)
    "#{name} eats #{food}"
  end
end

Animal.new