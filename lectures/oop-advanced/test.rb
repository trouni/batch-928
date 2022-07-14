require_relative 'restaurant'
require_relative 'fast_food_restaurant'
require_relative 'fine_dining_restaurant'

wagamama = Restaurant.new('Wagamama', 'Bristol', 40, 'japanese')
lolitas = Restaurant.new("Lolita's", 'San Diego', 20, 'mexican')

puts "#{wagamama.name} in #{wagamama.location} is a #{wagamama.category} restaurant."
puts "#{lolitas.name} in #{lolitas.location} is a #{lolitas.category} restaurant."

puts "#{wagamama.name} is currently #{wagamama.open? ? 'open' : 'closed'}."

wagamama.make_reservation('Bill')
wagamama.make_reservation('Joshua')
wagamama.make_reservation('Ayaka')
wagamama.make_reservation('Jan')
lolitas.make_reservation('Tony')
lolitas.make_reservation('Koki')

puts wagamama.print_reservations
puts lolitas.print_reservations

puts '-' * 30
mcdonalds = FastFoodRestaurant.new("McDonald's", 'Tokyo', 50, 'burgers', 2)
ivy = FineDiningRestaurant.new("The Ivy", 'Manchester', 12, 'modern british', 3)

mcdonalds.make_reservation('Koki')
mcdonalds.print_reservations

ivy.make_reservation('Sae')
ivy.print_reservations

puts '-' * 30
puts 'These categories are available:'
puts Restaurant.categories
