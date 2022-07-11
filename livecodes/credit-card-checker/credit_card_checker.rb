# 1. Create a CREDIT_CARD_REGEX_PATTERN variable containing a valid regex
CREDIT_CARD_REGEX_PATTERN = /\A[0-9]{16}\z/
# CREDIT_CARD_REGEX_PATTERN = /\A(?<first_digit>\d)[0-9]{15}\z/

def credit_card_checker(credit_card_number)
  cleaned_number = credit_card_number.delete(' -')

  # 2. Match the credit_card_number with the regex pattern
  if cleaned_number.match?(CREDIT_CARD_REGEX_PATTERN)
    # Get the company of the card
    card_brand =
      case cleaned_number[0]
      when '4' then 'VISA'
      when '5' then 'MasterCard'
      else 'Unknown'
      end

    # 3. Return the relevant string based on the match result
    "Valid #{card_brand} credit card number"
  else
    'Invalid credit card number'
  end
end
