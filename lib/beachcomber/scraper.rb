require'pry'
require'nokogiri'
require'open-uri'


class Beachcomber::Scraper

    BASE_TIDE_URL = "http://www.tides.net/"

    @@states_hash = { } # hash to hold state names and url's used to create state objects

  def self.scrape_states
    doc = Nokogiri::HTML(open(BASE_TIDE_URL))
      doc.xpath('//p/a[@href]').each do |link| #xpath for each anchor tag
        @@states_hash[link.text.strip] = link['href'] # assign key = anchor tag text, value = anchor tag href
      end
  end

  def self.states_hash
    @@states_hash
  end

end # end of class
