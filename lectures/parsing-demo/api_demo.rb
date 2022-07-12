require "json"
require "open-uri"

# TODO - Let's fetch name and bio from a given GitHub username
def get_github_info(username)
  url = "https://api.github.com/users/#{username}"

  user_serialized = URI.open(url).read

  user = JSON.parse(user_serialized)

  puts "#{user['name']} is based in #{user['location']} and has #{user['public_repos']} public repositories.\n#{user['name']} works at #{user['company']}."
end

puts "Who do you want to see?"
print '> '
username = gets.chomp

get_github_info(username)
