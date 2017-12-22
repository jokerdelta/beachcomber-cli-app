require'pry'
require'nokogiri'
require'open-uri'


class Beachcomber::Scraper

  attr_accessor :index_url, :region

    @@index_url = "http://www.tides.net/"


    def self.scrape_regions
      doc = Nokogiri::HTML(open(@@index_url))
      doc.css("p strong")
    end # end of method

  def self.scrape_states
    doc = Nokogiri::HTML(open(@@index_url))
    doc.css("p a")
  end # end of method

end # end of class
