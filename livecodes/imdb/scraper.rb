require 'open-uri'
require 'nokogiri'

def get_top_five_movie_urls
  # 1. Set the url to scrape
  url = "https://www.imdb.com/chart/top"
  # 2. Download (read) the HTML from that url (using URI.open)
  html_file = URI.open(url).read
  # 3. Parse the HTML into a Nokogiri document
  html_doc = Nokogiri::HTML(html_file)
  # 4. Search for the element to scrape
  html_doc.search(".titleColumn a").first(5).map do |element|
    # 5. Return an array of urls
    "https://www.imdb.com#{element.attributes["href"].value}"
  end
end

def scrape_movie_info(url)
  html_file = URI.open(url, 'Accept-Language' => 'en').read
  html_doc = Nokogiri::HTML(html_file)

  html_doc.search(".titleColumn a").first(5).map do |element|
    "https://www.imdb.com#{element.attributes["href"].value}"
  end

  cast = html_doc.search('.sc-36c36dd0-1').first(3).map do |element|
    element.text.strip
  end
  director = html_doc.search(".ipc-metadata-list-item__list-content-item")[0].text.strip
  storyline = html_doc.search(".sc-16ede01-2").text.strip
  title = html_doc.search('.sc-b73cd867-0').text.strip
  year = html_doc.search('.WIUyh').text.strip.slice(0..3).to_i

  {
    cast: cast,
    director: director,
    storyline: storyline,
    title: title,
    year: year
  }
end
