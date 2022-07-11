CREDIT_CARD_REGEX = /\A\d{16}\z/

def valid_luhn_sum?(cleaned_number)
  numbers = cleaned_number.chars.map { |char| char.to_i }
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
  sum.to_s.end_with?('0')
end

def credit_card_checker(credit_card_number)
  cleaned_number = credit_card_number.delete(' -')
  return 'Invalid credit card' unless cleaned_number =~ CREDIT_CARD_REGEX
  return 'Invalid credit card' if !valid_luhn_sum?(cleaned_number)

  if cleaned_number[0] == '4'
    'Valid VISA credit card'
  elsif cleaned_number[0] == '5'
    'Valid MasterCard credit card'
  end
end

p valid_luhn_sum?('4242424242424243')
