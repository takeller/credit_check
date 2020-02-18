require 'pry'

class CreditCard
  attr_reader :card_number, :limit

  # initialize card_number and limit as strings
  def initialize(card_number, limit)
    @card_number = card_number
    @limit = limit
  end

    def is_valid?
      luhn(@card_number)
    end

    def last_four
      @card_number[-4..-1]
    end
end


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
    #p "The number #{card_number} is valid!"
    true
  else
  #  p "The number #{card_number} is invalid!"
    false
  end
end

binding.pry

Sally = CreditCard.new('5541808923795240', 5000)
Sally.is_valid?
# Output
## If it is valid, print "The number [card number] is valid!"
## If it is invalid, print "The number [card number] is invalid!"
