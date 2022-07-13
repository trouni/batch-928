require_relative "../citizen"

describe Citizen do
  describe '#initialize' do
    it 'returns an instance of Citizen' do
      nikki = Citizen.new('Nikki', 'Carlos', 19)
      expect(nikki).to be_a(Citizen)
    end
  end

  describe '#can_vote?' do
    it 'returns true if the citizen is more than 18 years old' do
      nikki = Citizen.new('Nikki', 'Carlos', 18)
      expect(nikki.can_vote?).to eq(true)
    end

    it 'returns false if the citizen is less than 18 years old' do
      nikki = Citizen.new('Nikki', 'Carlos', 17)
      expect(nikki.can_vote?).to eq(false)
    end
  end

  describe '#full_name' do
    it 'returns the full name of the citizen' do
      nikki = Citizen.new('nikki', 'carlos', 19)
      expect(nikki.full_name).to eq('Nikki Carlos')
    end
  end
end