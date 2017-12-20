# CLI controller

class Beachcomber::CLI

  attr_accessor :country, :state_territory, :beach, :index_url, :region_url


  def  call
        get_country_input
        get_region_input(country)
  end

def get_country_input
  puts "What country will you be doing your beachcombing today?"
  puts "1. United States"
  puts "2. United Kingdom"
  input = nil
  while input != "exit"
    input = gets.strip.to_i
      if input == 1
        country="United States"
        # Scraper.select_index_url("United States")
        # Scraper.scrape_index_page(index_url)
        # self.country= ("United States")
        # self.list_US_states
        # put code in here to instatiate scraper and call scrape index page
      elsif input == 2
        country="United Kingdom"
        # Scraper.select_index_url("United States")
        # Scraper.scrape_index_page(index_url)
          # self.country= ("United Kingdom")
          #  self.list_UK_territories
      else
        puts "Please enter a valid number (1 or 2)."
        self.call # if invalid input is entered, start over again : )
      end
      Scraper.select_index_url("#{country}")
      Scraper.scrape_index_page
    end
 end

def list_US_states
  # country = "United States"
  region_array = ["Alabama", "Alaska", "American Samoa","California", "Connecticut", "Deleware", "Florida", "Georgia", "Hawaii", "Louisiana", "Maine", "Maryland","Massachusetts",
    "Mississippi","New Hampshire", "New York", "North Carolina", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "Texas", "Virginia",
    "Washington", "Washington DC" ]
    self.print_regions(region_array)
    end # end of method

def list_UK_territories
  country = "United Kingdom"
  region_array = ["England", "Isle of Man", "Channel Islands","Scotland", "Wales", "Ireland"]
    self.print_regions(region_array)
end

def print_regions(region_array)
  3.times do |n|
      print "\n" # print 5 blank lines
  end
  puts "Low-tide forcasts are available for the following areas of the #{self.country}: "
    region_array.each_with_index do |region, index|
    number = index + 1
    printf (" %5d. %-20s \n "  %[number, region]) #number 5s, left / loc 20s, right
  end #end of block
end

def get_region_input(country)

    if country == "United States"
    puts "Please enter the number of the state where you will you be doing your beachcombing:"
  elsif country == "United Kingdom"
    region_array = ["England", "Isle of Man", "Channel Islands","Scotland", "Wales", "Ireland"]
    puts "Please enter the number of the territory where you will you be doing your beachcombing:"
  end
    input = gets.strip.to_i
    region_index = input -1
     puts region_array[region_index]
  end



end #end of class
