require_relative 'scraper'
require 'yaml'

top_five_urls = get_top_five_movie_urls

scraped_movies = top_five_urls.map do |url|
  scrape_movie_info(url)
end

File.open('movies.yml', 'wb') do |file|
  file.write(scraped_movies.to_yaml)
end
