require 'open-uri'
require 'nokogiri'

# Let's scrape recipes from https://www.bbcgoodfood.com

def get_recipes(ingredient)
  url = "https://www.bbcgoodfood.com/search/recipes?q=#{ingredient}"

  html_file = URI.open(url).read
  html_doc = Nokogiri::HTML(html_file)

  html_doc.search('.standard-card-new__article-title').each do |element|
    puts '-' * 50
    puts element.text.strip
    puts element.attribute('href').value
    puts '-' * 50
  end
end

puts 'What recipes would you like to see?'
print '> '

ingredient = gets.chomp

get_recipes(ingredient)
