require 'faker'

puts "Destroying all the restaurants..."
Restaurant.destroy_all

puts "Creating 50 restaurants..."
50.times do
  Restaurant.create!(
    name: Faker::TvShows::Buffy.episode,
    address: Faker::Address.full_address,
    rating: rand(1..5),
    category: Faker::TvShows::Buffy.character,
  )
end
puts "Done!"