class InvalidType < StandardError; end

class Region

    attr_accessor :name, :index_url


    def initialize(name)
      @name = name
      @state_territories = [ ] #empty array to hold state_territory objects "has many" relationship
    end

    def state_territories  #freeze array so that u can't add state_territories directly to it anymore, can only use "add_state_territory"
        @state_territories.dup.freeze
    end

    def add_state_territory(state_territory)
        if !state_territory.is_a?(State_territory) #if not State_territory object
            raise InvalidType, "must be a State_territory object" # custom error message
        else
        @state_territories  << state_territory # push object onto array
        end
    end

end
