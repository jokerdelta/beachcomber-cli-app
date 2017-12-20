Beachcomber CLI Data Gem

1.	 Plan your gem, imagine your interface - Done!
2.	Start with the project structure – google. - Done!
3.	Start with the entry point – the File run - Done!
4.	Force that to build the CLI interface - Done!
5.	Stub out the interface - Done!
6.	Start making things real
7.	Discover objects
8.	Program

A command line interface for best times to go beachcombing, starting when user types beachcomber
User types beachcomber
Shows a menu, asks for US or UK
User types number next to US or UK
Shows a list of states
1.	Alabama	10. Louisiana	19. Oregon
2.	Alaska	11. Maine	20. Pennsylvania
3.	 American Samoa	12. Maryland	21. Rhode Island
4.	California	13. Massachusetts	22. South Carolina
5.	Connecticut	14. Mississippi	23. Texas
6.	Delaware	15. New Hampshire	24. Tokelau
7.	Florida	16. New Jersey	25. Virginia
8.	Georgia	17. New York	26. Washington
9.	Hawaii	18. North Carolina	27. Washington DC


	CLI will display the states and prompt the user to enter the number of the state
	User will enter the number of the state
	CLI will display the beach locations of the selected state and prompt user to select a beach
	User will enter the number of the beach

  User will enter the number of the beach
CLI will display the low tide times and low tide levels for the day

Objects
CLI
LowTideScraper
State (Name, Beaches)
Beach (Name, State, Low Tide Time1, Low Tide Level1, Low Tide Time 2, Low Tide Level 2)
Relationships
A state has many beaches
@beaches = [ ]
A beach has a state
attr_accessor: state

TO DO
We need a LowTideScraper class
That class needs to instantiate the state based on the state number
We need to scrape the details of that state for the beach locations
We need to scrape the beach locations for that state and add them to that instance

URL’s
https://tidesandcurrents.noaa.gov/tide_predictions.html

http://www.ntslf.org/tides/predictions
port = doc.css(".row p strong")
port.each do |port|

puts port[0]
port 0,24
