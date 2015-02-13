#select a "set" to check
def pickCards(card, table, hand)
	puts "Pick 3 cards\n"
	i = 3 #index
	while i > 0
		card = gets.chomp
		#indeed in table and not already selected, put it in hand
		if table.include? card and !hand.include? card
			i -= 1
			hand << card
		else
			puts "Invalid card option\n"
		end
	end
end