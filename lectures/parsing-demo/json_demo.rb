require 'json'

# TODO: - let's read/write data from beatles.json
filepath = 'data/beatles.json'

# PARSING JSON
serialized_beatles = File.read(filepath) # returns the json as a string

parsed_beatles = JSON.parse(serialized_beatles)
# parsed_beatles['beatles'] # <= accesses the beatles array

# STORING JSON

# Adding a beatle to the 'beatles' array in the parsed_beatles hash
parsed_beatles['beatles'] << {
  first_name: 'Justin',
  last_name: 'Bieber',
  instrument: 'Back vocals'
}

File.open(filepath, 'wb') do |file|
  file.write(JSON.generate(parsed_beatles))
end
