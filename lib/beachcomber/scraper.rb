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

  def self.scrape_state(index)
    state = Beachcomber::CLI.states[index] # retrieve state object from CLI states array
    doc = Nokogiri::HTML(open("#{BASE_TIDE_URL}"+"#{state.url}")) # concatenate base index url with state objects url
    doc.xpath('//p/a[@href]').each do |link| #xpath for each anchor tag (beach)
      @@beach_hash[link.text.strip] = link['href'] unless link.text.strip == "About / Warning" # assign key = anchor tag text, value = anchor tag href unless  not beach text
    end
  end

  def self.scrape_beach(state_index, beach_index)
    state = Beachcomber::CLI.states[state_index] # retrieve state object from CLI states array
    beach = state.beaches[state.beach_index]
    doc = Nokogiri::HTML(open("#{beach.url}"))
      doc.css('.wrap_textual_details').each do |a|
        puts a.text
      end
      rescue
        puts "Oh no!  An error occured when Beachcomber attempted to retrieve the tidal predictions for #{state.name}. "
        puts "Please try again at a later time, or visit www.tides.net for an explanation."
        self.scrape_state(state_index)
      end

  def self.states_hash
    @@states_hash
  end

  def self.beach_hash
    @@beach_hash
  end

end # end of class
