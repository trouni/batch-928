require_relative '../scraper'

describe '#get_top_five_movie_urls' do
  it 'returns an array containing the urls of the top five movies on IMDB' do
    actual = get_top_five_movie_urls
    expected = [
      "https://www.imdb.com/title/tt0111161/",
      "https://www.imdb.com/title/tt0068646/",
      "https://www.imdb.com/title/tt0468569/",
      "https://www.imdb.com/title/tt0071562/",
      "https://www.imdb.com/title/tt0050083/"
    ]
    expect(actual).to eq(expected)
  end
end

describe '#scrape_movie_info' do
  it 'returns a hash containing the information about the movie' do
    url = 'https://www.imdb.com/title/tt0468569/'
    actual = scrape_movie_info(url)
    expected = {
      cast: ['Christian Bale', 'Heath Ledger', 'Aaron Eckhart'],
      director: 'Christopher Nolan',
      storyline: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
      title: 'The Dark Knight',
      year: 2008
    }
    expect(actual).to eq(expected)
  end
end
