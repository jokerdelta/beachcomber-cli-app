require'pry'
require'nokogiri'
require'open-uri'


class Beachcomber::Scraper

  attr_accessor :index_url, :region

    @@index_url = "http://www.tides.net/"


    def self.create_regions_from_Index_page
      doc = Nokogiri::HTML(open(@@index_url))
      doc.css("p strong").each do |region_name|
      name = region_name.to_str
      region = Region.new(name)
      Beachcomber::CLI.add_region(region)
    end
      #iterate through the regions

  end # end of method

  def self.scrape_region_page(region_url) #state or territory page
    doc = Nokogiri::HTML(region_url)
       scraped_region = { } # set up empty hash

            # link = doc.css("div.social-icon-container a") #shortcut to social-icon-container which contains the anchor tags
            #    link.each do |a| # iterate over each anchor tag in the social-icon-container
            #       url_string = a["href"].to_s
            #       scraped_student [:profile_quote] = student_profile.css("div.profile-quote").text if student_profile.css("div.profile-quote").text
            #      scraped_student [:bio] = student_profile.css("div.description-holder p").text if student_profile.css("div.description-holder p").text
            #
            #   end # end of enumerator block
            #
            # scraped_region

      end # end of method

end # end of class
