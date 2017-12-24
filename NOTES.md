Beachcomber CLI Data Gem

WORKING ON scraper scrape_beach method****

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


	CLI will display the states and prompt the user to enter the number of the state- DONE
	User will enter the number of the state - DONE
	CLI will display the beach locations of the selected state and prompt user to select a beach - DONE
	User will enter the number of the beach
CLI will display the low tide times and low tide levels for the day

Objects
CLI
Scraper
State (Name, Beaches)
Beach (Name, State, Low Tide Times, High Tide Times)
Relationships
CLI has many states, state has many beaches
A beach has a state

TO DO
We need a Scraper class - DONE
Need a CLI class  - DONE
We need to scrape the index page for the names of all the states - DONE
We need to use each name to create a state object, add each state to array in CLI - DONE
We need to scrape the details of each states page for the beach locations - DONE
We need to create beach objects and add them to each state object in the state array - DONE
We need to scrape the beach page for high and low tide levels

URL’s
BASE_TIDE_URL = "http://www.tides.net"
