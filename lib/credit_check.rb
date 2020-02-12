card_number = "6011797668868728"

# Luhn Algorithm
def luhn(card_number)
  dbl_every_other = []
  sum_over_10 = []
  total_sum = 0
  i = 1
  # Convert the card_number from a string to an array of numbers
  card_number_array = card_number.each_char.map(&:to_i)
  # Fill out array for summed digits
  card_number_array.each do |x|
    # Dbl every other digit starting with the first
    if i.odd? == true
      dbl_every_other[i-1] = x * 2
    else
      dbl_every_other[i-1] = x
    end

    # Check if the integer is greater than 10, and if so sum the digits of that
    # number
    if dbl_every_other[i-1] >= 10
      digits = dbl_every_other[i-1].to_s.split(//).map(&:to_i)
      sum_over_10 << digits[0] + digits[1]
    else
      sum_over_10 << dbl_every_other[i-1]
    end
    i += 1
  end
  # Take total sum and check the validity of the card number
  total_sum = sum_over_10.sum
  if total_sum % 10 == 0
    p "The number #{card_number} is valid!"
  else
    p "The number #{card_number} is invalid!"
  end
end

luhn(card_number)
# Output
## If it is valid, print "The number [card number] is valid!"
## If it is invalid, print "The number [card number] is invalid!"
