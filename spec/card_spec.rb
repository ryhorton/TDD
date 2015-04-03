require 'rspec'
require 'card'

describe Card do
  subject(:card) { Card.new(:clubs, 5) }
  let(:card2) { Card.new(:spades, 7) }

  describe '#initialize' do
    it "initializes with suit" do
      expect(card.suit).to eq(:clubs)
    end

    it "initializes with value" do
      expect(card.value).to eq(5)
    end
  end

  describe '#==(other_card)' do
    it "tests whether two cards are the same" do
      expect(card == card2).to be false
    end
  end

end
