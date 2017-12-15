require "rubygems"
require "nokogiri"
require 'open-uri'
require 'pry'

class Scraper

    attr_accessor :country



    def initialize

    def self.scrape_index_page(index_url)
      html = index_url
      doc = Nokogiri::HTML(html)
      scraped_regions = [ ] #set up empty array to hold each region hash
      #iterate through the regions
      doc.css("div.student-card").each do |region| #iterate through each region link
      scraped_regions << { :name => doc.css("h4.student-name").text, # add region hash to scraped_regions array
          }
      end
    scraped_regions # return scraped regions array
  end # end of method

  def self.scrape_region_page(region_url) #state or territory page
    html = region_url
    doc = Nokogiri::HTML(html)
       scraped_region = { } # set up empty hash

            link = doc.css("div.social-icon-container a") #shortcut to social-icon-container which contains the anchor tags
               link.each do |a| # iterate over each anchor tag in the social-icon-container
                  url_string = a["href"].to_s
                  scraped_student [:profile_quote] = student_profile.css("div.profile-quote").text if student_profile.css("div.profile-quote").text
                 scraped_student [:bio] = student_profile.css("div.description-holder p").text if student_profile.css("div.description-holder p").text

              end # end of enumerator block

            scraped_region

      end # end of method

end # end of class
