# load functions
load 'check.rb'
load 'LayCards.rb'
load 'pointTracker.rb'
load 'pickCards.rb'

=begin 
declare, shuffle, and deal out "cards"

cards = array of 81 cards
hand = 3 cards selected from the deck
card = string with value entered from user
i = index
=end
cards, hand, card = ["0000","0001","0002","0010","0011","0012","0020",
	"0021","0022","0100","0101","0102","0110","0111","0112",
	"0120","0121","0122","0200","0201","0202","0210","0211",
	"0212","0220","0221","0222","1000","1001","1002","1010",
	"1011","1012","1020","1021","1022","1100","1101","1102",
	"1110","1111","1112","1120","1121","1122","1200","1201",
	"1202","1210","1211","1212","1220","1221","1222","2000",
	"2001","2002","2010","2011","2012","2020","2021","2022",
	"2100","2101","2102","2110","2111","2112","2120","2121",
	"2122","2200","2201","2202","2210","2211","2212","2220",
	"2221","2222"],[], ""
cards = cards.shuffle


#table = the first 12 cards from the shuffled cards array

table = cards[0,12]

#delete cards that are dealt to table

cards -= table



# TODO READ NEXT COMMENT - IS THAT HOW WE WANT TO LEAVE IT?
#while loop runs unitl the deck is empty, the last table of 12 cards is discarded (for the time being)
while (!(cards.empty?)) 

	#displays the table
	puts(table)


	#pick 3 valid cards
	pickCards(card, table, hand)

	#keep asking user to select 3 cards until a set is found
	while !checker(hand[0],hand[1],hand[2])
		puts "This is not a set! Please select 3 more cards.\n"
		hand.clear
		pickCards(card, table, hand)
	end

	puts "You have chosen a set!\n \n"

	#delete an identified set of cards from table
	table -= hand
	#clear hand
	hand.clear
	#hand is used to transfer only 3 new cards to the running table view
	hand += cards[0,3]	

	#hand subtracks out the 3 cards it just took from the deck (cards)
	cards -= hand
	#hand gives them to the table
	table += hand
	#then hand clears its self, ready to pick up 3 that form a set at the top of the loop
	hand.clear

end

puts "Congrats, you have finished the game!"
