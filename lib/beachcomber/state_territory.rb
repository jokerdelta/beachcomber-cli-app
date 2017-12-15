class State_territory

  attr_accessor :name, :country, :url

  def initialize
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

end
