# CLI controller
require'pry'

class Beachcomber::CLI

  # attr_accessor :country, :state_territory, :beach, :index_url, :region_url
  @@regions = [ ]

  def  call
        get_region_input
        # get_state_input
  end

def get_region_input
  puts "Welcome fellow beachcomber!  Which region would you like to beachcomb today?"
  self.list_regions

  input = nil
    while input != "exit"
        input = gets.strip.to_i - 1
        self.list_US_states[input]
    end


    end

  def list_regions
    Beachcomber::Scraper.scrape_regions
    Region::create_from_webpage
    @@regions.each_with_index do |region, index|
      number = index + 1
      name = region.name
      puts "#{number}.  #{name}"
    end
    end # end of method



def self.add_region(region)
    if !region.is_a?(Region) #if not Region object
        raise InvalidType, "must be a Region object" # custom error message
    else
    @@regions  << region # push object onto array
    end
end

end #end of class
