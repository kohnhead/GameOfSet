class MyClass

	include GladeGUI
	load 'check.rb'	

	def initialize()
		# Keeps track of cards clicked by user.
		@@clickedCards = []

		# Keeps track of the butons clicked by user.
		@@clickedButtons = []

		# All cards in the deck.
		@@cards = ["0000","0001","0002","0010","0011","0012","0020",
		"0021","0022","0100","0101","0102","0110","0111","0112",
		"0120","0121","0122","0200","0201","0202","0210","0211",
		"0212","0220","0221","0222","1000","1001","1002","1010",
		"1011","1012","1020","1021","1022","1100","1101","1102",
		"1110","1111","1112","1120","1121","1122","1200","1201",
		"1202","1210","1211","1212","1220","1221","1222","2000",
		"2001","2002","2010","2011","2012","2020","2021","2022",
		"2100","2101","2102","2110","2111","2112","2120","2121",
		"2122","2200","2201","2202","2210","2211","2212","2220",
		"2221","2222"]
		@@cards = @@cards.shuffle

		# Selects 12 random cards to place on table.
		@@table = @@cards[0, 12]
		# Deletes cards on table from the deck of cards.
		@@cards.delete_if {|x| @@table.include? x} 
	end

	def before_show()
		@path = File.dirname(__FILE__) + "/"
		setImages
	end	

	def setImages
		
		# Insert cards from the table into the deck of cards.
		# Shuffle cards, select 12, and delete selected cards from deck.
		@@cards += @@table
		@@cards.shuffle
		@@table = @@cards[0, 12]
		@@cards.delete_if {|x| @@table.include? x} 

		# Give each image on the GUI table a card image from file system.
		@image1 = @path + @@table[0] + ".jpg"
		@image2 = @path + @@table[1] + ".jpg"
		@image3 = @path + @@table[2] + ".jpg"
		@image4 = @path + @@table[3] + ".jpg"
		@image5 = @path + @@table[4] + ".jpg"
		@image6 = @path + @@table[5] + ".jpg"
		@image7 = @path + @@table[6] + ".jpg"
		@image8 = @path + @@table[7] + ".jpg"
		@image9 = @path + @@table[8] + ".jpg"
		@image10 = @path + @@table[9] + ".jpg"
		@image11 = @path + @@table[10] + ".jpg"
		@image12 = @path + @@table[11] + ".jpg"

		# Sync this ruby file with the glade file that controls the GUI.
		set_glade_all()
	end 

	def switchCards
	# Given that a set has been identified, switches the clicked cards
	# with new cards from the deck.

		# Select three new cards from the deck.
		if @@cards.length >= 3
			newCards = @@cards[0, 3]
		
			# Add new cards to the table, delete clicked cards from the table,
			# and delete all cards on the table from the deck.
			@@table += newCards
			@@table.delete_if {|x| @@clickedCards.include? x}
			@@cards.delete_if {|x| @@table.include? x} 
			
			# Enable each button clicked and update to new card image.
			@@clickedButtons.each {|x| x.sensitive = true}
			@@clickedButtons.each_with_index { |x, index| x.image.file = @path +
		 	newCards[index] + ".jpg" }
		else 
			# Deck is emptpy, give each card a label.
			newCards = []
			@@clickedButtons.each {|x, index| x.label = "No new cards." }
		end
		
		# No cards left on the table, end the game.
		if @@table.length == 0
			exit!(0)
		end
	end

	def getImageName(imageName)
	# Takes a string with an absolute filepath and strips 
	# to just the image name.
 
		image_name =  imageName
		image_name.slice! @path
		image_name.slice! ".jpg"
		return image_name
	end
	
	def setOrNot
	# Identifies whether a set has been made.
	# If so, cards are swapped.

		if @@clickedCards.length == 3
			if checker(@@clickedCards[0], @@clickedCards[1], @@clickedCards[2])
				puts "Set made. Congrats."
				
				# Increments the point counter.
				current = @builder['button15'].label.to_i
				current += 1
				@builder['button15'].label = current.to_s

				# Replaces the cards that were a part of the set.
				switchCards
			else
				puts "Not a set!"
				# Enables each of the buttons.
				@@clickedButtons.each {|x| x.sensitive = true}
			end
				@@clickedCards = []
				@@clickedButtons = []
		end
	end
	
	def button13__clicked(*args)
	# Places new cards on the table.
		@@clickedButtons.each {|x| x.sensitive = true}
		setImages 		
	end

	def button14__clicked(*args)
	# Ends the game.
		exit!(0)
	end

	def button__clicked(*args)
	# If a button is clicked, determine the clicked button,
	# save the button clicked, save the image associated with
	# button, and determine if set has been made or not.
		file_name = getImageName(args[0].image.file)
		args[0].sensitive = false
		if !@@clickedCards.include? file_name
			@@clickedCards.push(file_name)
			@@clickedButtons.push(args[0])
		end
		setOrNot
	end
end

