require_relative '../lion'

describe Lion do
  describe '#initialize' do
    it 'returns an instance of Lion' do
      bob = Lion.new('Bob')
      expect(bob).to be_a(Lion)
    end
  end

  describe '#talk' do
    it 'returns "Bob roars"' do
      bob = Lion.new('Bob')
      expect(bob.talk).to eq("Bob roars")
    end

    it 'returns "Simba roars"' do
      simba = Lion.new('Simba')
      expect(simba.talk).to eq("Simba roars")
    end
  end

  describe '#eat' do
    it 'returns a sentence like "Bob eats a gazelle. Law of the Jungle!"' do
      bob = Lion.new('Bob')
      actual = bob.eat('a gazelle')
      expect(actual).to eq('Bob eats a gazelle. Law of the Jungle!')
    end
  end
end
