require_relative '../warthog'

describe Warthog do
  describe '#initialize' do
    it 'returns an instance of Warthog' do
      yann = Warthog.new('Yann')
      expect(yann).to be_a(Warthog)
    end
  end

  describe '#talk' do
    it 'returns "Yann grunts"' do
      yann = Warthog.new('Yann')
      expect(yann.talk).to eq("Yann grunts")
    end

    it 'returns "Pumbaa grunts"' do
      pumbaa = Warthog.new('Pumbaa')
      expect(pumbaa.talk).to eq("Pumbaa grunts")
    end
  end
end
