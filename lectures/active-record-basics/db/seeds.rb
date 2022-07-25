require 'faker'

puts 'Creating restaurants...'
50.times do
  Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    rating: rand(0..5),
  )
end
puts 'Finished!'