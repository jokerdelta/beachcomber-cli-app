# CLI controller
require'pry'

class Beachcomber::CLI

  # attr_accessor :country, :state_territory, :beach, :index_url, :region_url
  @@regions = [ ]

  def  call
        # get_region_input
        # get_state_input
        self.list_regions
        self.list_states
  end

def get_region_input
  puts "Welcome fellow beachcomber!  Which region would you like to beachcomb today?"
  self.list_regions
  self.list_states
  input = nil
    while input != "exit"
        input = gets.strip.to_i - 1
        self.list_regions[number]
    end


    end

  def list_regions
    Beachcomber::Scraper.scrape_regions
    Region.create_from_webpage
    @@regions.each_with_index do |region, index|
      number = index + 1
      name = region.name
      puts "#{number}.  #{name}"
      end
    end # end of method

    def list_states
      Beachcomber::Scraper.scrape_states
      State.create_from_webpage
      # Region.states.each_with_index do |state, index|
      #   number = index + 1
      #   name = region.name
      #   puts "#{number}.  #{name}"
        # end
    end



def self.add_region(region)
    if !region.is_a?(Region) #if not Region object
        raise InvalidType, "must be a Region object" # custom error message
    else
    @@regions  << region # push object onto array
    end
end

end #end of class
