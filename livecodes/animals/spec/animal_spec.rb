require_relative '../animal'

describe Animal do
  describe '#initialize' do
    it 'returns an instance of Animal' do
      lion = Animal.new('Lion')
      expect(lion).to be_an(Animal)
    end
  end

  describe '#name' do
    it 'exposes the name of the animal' do
      lion = Animal.new('Lion')
      actual = lion.name
      expect(actual).to eq('Lion')
    end
  end

  describe '#eat' do
    it 'returns a sentence like "Timon eats a scorpion"' do
      timon = Animal.new('Timon')
      actual = timon.eat('a scorpion')
      expect(actual).to eq('Timon eats a scorpion')
    end
  end

  describe '.phyla' do
    it 'returns the four phyla of the animal kingdom' do
      actual = Animal.phyla
      expect(actual).to eq([
        'the worms',
        'the molluscs',
        'the sea cucumbers',
        'the ones with the back end'
      ])
    end
  end
end