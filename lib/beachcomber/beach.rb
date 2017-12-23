class Beach

  attr_accessor :name, :state, :low_tide, :high_tide, :url

  def initialize(name)
    @name = name
    @low_tide = low_tide
    @high_tide = high_tide
    @url = url
  end

  def self.create_from_beach_hash
    Beachcomber::Scraper. beach_hash.each do |key, value| #cycle through scraper class's state hash
    beach = self.new(key)  unless key  == "About / Warning / Contact" # create new state object (except for last anchor tag text on page)
      if beach # put url assignment in if statement to prevent invalid type error if above anchor tag occurs
        beach.url= value
        # Beachcomber::CLI.add_beach(beach) # need to add beach to state/region here...
      end
  end
end



end
