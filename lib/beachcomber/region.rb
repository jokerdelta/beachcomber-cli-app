class InvalidType < StandardError; end

class Region

    attr_accessor :name, :index_url


    def initialize(name)
      @name = name
      @states = [ ] #empty array to hold state_territory objects "has many" relationship
    end

    def states #freeze array so that u can't add state_territories directly to it anymore, can only use "add_state_territory"
        @states.dup.freeze
    end

    def add_state(state)
        if !state.is_a?(State) #if not State object
            raise InvalidType, "must be a State object" # custom error message
        else
        @states  << state # push object onto array
        end
    end

    def self.create_from_webpage
       Beachcomber::Scraper.scrape_regions.each do |region_name|
        name = region_name.text.gsub(":","")#to_str
       region = self.new(name)
      Beachcomber::CLI.add_region(region)
    end
  end
end
