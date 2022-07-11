CREDIT_CARD_REGEX_PATTERN = /\A[0-9]{16}\z/

def credit_card_checker_enhanced(credit_card_number)
  cleaned_number = credit_card_number.delete(' -')
  
  if cleaned_number.match?(CREDIT_CARD_REGEX_PATTERN) && valid_luhn_check?(cleaned_number)
    card_brand =
      case cleaned_number[0]
      when '4' then 'VISA'
      when '5' then 'MasterCard'
      else 'Unknown'
      end
    
    "Valid #{card_brand} credit card number"
  else
    'Invalid credit card number'
  end
end

def valid_luhn_check?(credit_card_number)
  # 1. Drop the check digit (last digit) of the number to validate. (e.g. 4242424242424242 -> 424242424242424)
  numbers = credit_card_number[...-1].chars.map { |char| char.to_i }
  # 2. Calculate the check digit
  sum = 0
  numbers.each_with_index do |number, index|
    if index.even?
      doubled_number = number * 2
      if doubled_number > 9
        sum += doubled_number.digits.sum
      else
        sum += doubled_number
      end
    else
      sum += number
    end
  end
  check_digit = 10 - sum % 10
  # 3. Compare your result with the original check digit. If both numbers match, the result is valid.
  check_digit == credit_card_number[-1].to_i
end
