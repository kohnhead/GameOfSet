def checker(card4, card5, card6)
	card1=String.new(card4)
	card2=String.new(card5)
	card3=String.new(card6)


  # Verifies that the strings provided are a set.
  isValid = true

  # Checks that each value in the string is either
  # all the same attributes or all different.
  while card1.length > 0 && isValid
    value1, value2, value3 = card1[0], card2[0], card3[0]
    card1[0], card2[0], card3[0] = '', '', ''
    if (value1 != value2) || (value2 != value3)
      if (value1.to_i + value2.to_i + value3.to_i) != 3 
        isValid = false 
      end 
    end
  end
  
  return isValid
end
