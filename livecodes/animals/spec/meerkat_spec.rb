require_relative '../meerkat'

describe Meerkat do
  describe '#initialize' do
    it 'returns an instance of Meerkat' do
      doug = Meerkat.new('Doug')
      expect(doug).to be_a(Meerkat)
    end
  end

  describe '#talk' do
    it 'returns "Doug barks"' do
      doug = Meerkat.new('Doug')
      expect(doug.talk).to eq("Doug barks")
    end

    it 'returns "Timon barks"' do
      timon = Meerkat.new('Timon')
      expect(timon.talk).to eq("Timon barks")
    end
  end
end
