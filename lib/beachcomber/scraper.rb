require'pry'
require'nokogiri'
require'open-uri'


class Beachcomber::Scraper

    BASE_TIDE_URL = "http://www.tides.net"

    @@states_hash = { } # hash to hold state names and url's used to create state objects
    @@beach_hash ={} #hash to hold the names and urls used to create beach objects

  def self.scrape_index
    doc = Nokogiri::HTML(open(BASE_TIDE_URL))
      doc.xpath('//p/a[@href]').each do |link| #xpath for each anchor tag (state)
        @@states_hash[link.text.strip] = link['href'] # assign key = anchor tag text, value = anchor tag href
      end
  end

  def self.scrape_state(state)
    doc = Nokogiri::HTML(open("#{BASE_TIDE_URL} "+ "#{state.url}")) # concatenate base index url with state url
      doc.xpath('//p/a[@href]').each do |link| #xpath for each anchor tag (beach)
        @@beach_hash[link.text.strip] = link['href'] # assign key = anchor tag text, value = anchor tag href
      end
  end

  def self.states_hash
    @@states_hash
  end

  def self.beach_hash
    @@beach_hash
  end

end # end of class
