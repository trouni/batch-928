require_relative "../credit_card_checker"

describe '#credit_card_checker' do
  it 'returns `Invalid credit card` when passed an empty string' do
    actual = credit_card_checker('')
    expected = 'Invalid credit card'
    expect(actual).to eq(expected)
  end

  it 'returns `Invalid credit card` when passed a string with an invalid length' do
    actual = credit_card_checker('4242 4242 4242 4242 4242')
    expected = 'Invalid credit card'
    expect(actual).to eq(expected)
  end

  it 'returns `Invalid credit card` when passed at least one letter character' do
    actual = credit_card_checker('4242 4242 4242 424A')
    expected = 'Invalid credit card'
    expect(actual).to eq(expected)
  end

  it 'returns `Valid VISA credit card` when passed 4 groups of 4 digits separated by spaces and starting with 4' do
    actual = credit_card_checker('4242 4242 4242 4242')
    expected = 'Valid VISA credit card'
    expect(actual).to eq(expected)
  end

  it 'returns `Valid MasterCard credit card` when passed 4 groups of 4 digits separated by hyphens and starting with 5' do
    actual = credit_card_checker('5555-5555-5555-4444')
    expected = 'Valid MasterCard credit card'
    expect(actual).to eq(expected)
  end

  it 'returns `Valid VISA credit card` when passed 16 digits no matter the spacing between the digits and starting with 4' do
    actual = credit_card_checker(' 4242   42 42 4 242 42 42   ')
    expected = 'Valid VISA credit card'
    expect(actual).to eq(expected)
  end

  it "returns 'Invalid credit card number' when passed a VISA credit card with an invalid Luhn sum" do
    actual = credit_card_checker("4242 4242 4242 4241")
    expected = "Invalid credit card"
    expect(actual).to eq(expected)
  end

  it "returns 'Invalid credit card' when passed a Mastercard credit card with a valid Luhn sum, whatever space there may be" do
    actual = credit_card_checker("  55 555555 5 5555577   ")
    expected = "Invalid credit card"
    expect(actual).to eq(expected)
  end

  it "returns 'Valid MasterCard credit card' when passed a Mastercard credit card with a valid Luhn sum, whatever space there may be" do
    actual = credit_card_checker("  55 555555 5 5554444   ")
    expected = "Valid MasterCard credit card"
    expect(actual).to eq(expected)
  end
end
