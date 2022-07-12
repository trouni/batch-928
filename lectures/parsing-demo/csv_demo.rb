require 'csv'

# TODO: - let's read/write data from beatles.csv
filepath = 'data/beatles.csv'

# PARSING CSV
beatles = []
CSV.foreach(filepath, headers: :first_row) do |row|
  beatles << {
    first_name: row['First Name'],
    last_name: row['Last Name'],
    instrument: row['Instrument']
  }
end

# Adding a beatle to my CSV
beatles << {
  first_name: 'Justin',
  last_name: 'Bieber',
  instrument: 'Back vocals'
}

# STORING CSV
CSV.open(filepath, 'wb', force_quotes: true) do |csv|
  csv << ['First Name', 'Last Name', 'Instrument']
  beatles.each do |beatle|
    csv << [beatle[:first_name], beatle[:last_name], beatle[:instrument]]
  end
end
