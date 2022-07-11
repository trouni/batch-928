require_relative '../credit_card_checker'

describe '#credit_card_checker' do
  it 'returns `Invalid credit card number` when passed an empty string' do
    actual = credit_card_checker('')
    expected = 'Invalid credit card number'
    expect(actual).to eq(expected) # rpsec checks that actual == expected
  end

  it 'returns `Valid VISA credit card number` when passed `4242 4242 4242 4242`' do
    actual = credit_card_checker('4242 4242 4242 4242')
    expected = 'Valid VISA credit card number'
    expect(actual).to eq(expected)
  end

  it 'returns `Valid VISA credit card number` when passed `4242-4242-4242-4242`' do
    actual = credit_card_checker('4242-4242-4242-4242')
    expected = 'Valid VISA credit card number'
    expect(actual).to eq(expected)
  end

  it 'returns `Valid MasterCard credit card number` when passed `5555555555555555`' do
    actual = credit_card_checker('5555555555555555')
    expected = 'Valid MasterCard credit card number'
    expect(actual).to eq(expected)
  end

  it 'returns `Valid VISA credit card number` when passed 16 digits and whatever spacing' do
    actual = credit_card_checker('  424 24   24  24242 4 242  ')
    expected = 'Valid VISA credit card number'
    expect(actual).to eq(expected)
  end

  it 'returns `Invalid credit card number` when passed less than 16 digits' do
    actual = credit_card_checker('4242 4242 4242 42')
    expected = 'Invalid credit card number'
    expect(actual).to eq(expected)
  end

  it 'returns `Invalid credit card number` when passed at least a letter character' do
    actual = credit_card_checker('4242 4242 4242 424A')
    expected = 'Invalid credit card number'
    expect(actual).to eq(expected)
  end

  it 'returns `Invalid credit card number` when passed at least a special character' do
    actual = credit_card_checker('4242 4242 4*42 4242')
    expected = 'Invalid credit card number'
    expect(actual).to eq(expected)
  end

  it 'returns `Invalid credit card number` when passed more than 16 digits' do
    actual = credit_card_checker('4242 4242 4242 4242 42')
    expected = 'Invalid credit card number'
    expect(actual).to eq(expected)
  end
end