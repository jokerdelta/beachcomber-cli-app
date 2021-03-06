require'pry'


class State

  attr_accessor :name,  :url, :beach_index

  def initialize(name)
    @name = name
    @url = url
    @beaches = [ ] #empty array to hold 'beach' objects (has many relationship)
    @beach_index = nil
  end

  def beaches #freeze array so that u can't add beaches directly to it anymore, can only use "add_beach method"
      @beaches.dup.freeze
  end

  def add_beach(beach)
      if !beach.is_a?(Beach) #if not Beach object
          raise InvalidType, "must be a Beach object" # custom error message
      else
        @beaches  << beach# push object onto array
      end
  end

  def self.create_from_state_hash
    Beachcomber::Scraper. states_hash.each do |key, value| #cycle through scraper class's state hash
    state = self.new(key) unless key  == "About / Warning / Contact" # create new state object (except for last anchor tag text on page)
      if state # put url assignment in if statement to prevent invalid type error if above anchor tag occurs
        state.url= value
        Beachcomber::CLI.add_state(state) #add state to cli states array
      end
  end
end

def list_beaches  # cycle through beach object in beaches  array
  puts "Tide predictions for the following beaches in #{self.name} are available:"
  @beaches.each_with_index do |beach, index|
    number = index + 1
    name = beach.name
    puts "#{number}.  #{name}" # print the name of each beach object in array
  end
end

def get_beach_input
  puts "Please enter the number of the beach where you would like to go beachcombing:"
  input = gets.strip
  self.beach_index = input.to_i - 1 #convert input to integer, subtract 1 to convert to beach array index
end

def beach_index
  @beach_index
end

end # end of class
