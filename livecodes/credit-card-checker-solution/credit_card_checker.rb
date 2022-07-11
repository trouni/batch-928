CREDIT_CARD_REGEX = /\A\d{16}\z/

def credit_card_checker(credit_card_number)
  cleaned_number = credit_card_number.delete(' -')
  return 'Invalid credit card' unless cleaned_number =~ CREDIT_CARD_REGEX

  if cleaned_number[0] == '4'
    'Valid VISA credit card'
  elsif cleaned_number[0] == '5'
    'Valid MasterCard credit card'
  end
end
