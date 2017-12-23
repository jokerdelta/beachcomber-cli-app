class State

  attr_accessor :name, :region, :url

  def initialize(name)
    @name = name
    @url = url
    @beaches = [ ] #empty array to hold 'beach' objects (has many relationship)
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

  def self.create_from_state_hash # NEED TO TEST THIS !!!
    Beachcomber::Scraper. states_hash.each do |key, value| #cycle through scraper class's state hash
    state = self.new(key) unless key  == "About / Warning / Contact" # create new state object (except for last anchor tag text on page)
      if state # put url assignment in if statement to prevent invalid type error if above anchor tag occurs
        state.url= value
        Beachcomber::CLI.add_state(state)
      end
  end
end

end # end of class
