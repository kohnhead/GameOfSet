
def lay_cards(deck_of_cards, n)

	#shuffle deck
	deck_of_cards.shuffle
	
	#array of cards to be laid
	laid_cards = []
	i = 0

	#lay n cards
	while i < n
		
		#add first card in deck_of_cards to laid_cards
		laid_cards[i] = deck_of_cards[0]
		
		#remove first card from deck_of_cards
		deck_of_cards.shift

		i = i + 1
	
	end

	return laid_cards

end
