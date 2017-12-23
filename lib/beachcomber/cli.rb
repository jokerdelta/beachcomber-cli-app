# CLI controller

class InvalidType < StandardError; end

require'pry'

class Beachcomber::CLI

  @@states = [ ] # array to hold all the state objects

  def  call
    Beachcomber::Scraper.scrape_index # scrape state names/url from index page and place in hash
    State.create_from_state_hash #create State objects from hashes above
    self.list_states #cycle through state object names and print to screen
    self.get_state_input
  end

  def list_states  # cycle through state object names in @@states array
    @@states.each_with_index do |state, index|
      number = index + 1
      name = state.name
      puts "#{number}.  #{name}"
      end
  end

def get_state_input
  puts "Please enter the number of the state/region you would like to beachcomb today:"
  input = gets.strip
  index = input.to_i - 1
  # puts @@states[index].url

end


def self.add_state(state) # add state object to @@state array above
    if !state.is_a?(State) #if not State object
        raise InvalidType, "must be a State object" # custom error message
    else
    @@states  << state # push state object onto array
    end
end

end #end of class
