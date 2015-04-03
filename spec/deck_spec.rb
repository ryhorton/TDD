require 'rspec'
require 'deck'

describe Deck do

  subject(:deck) { Deck.new }
  let(:deck2) do
    Deck.new([Card.new(:clubs, 3), Card.new(:diamonds, 4)])
  end

  describe '#initialize' do
    it 'initializes with 52 cards by default' do
      expect(deck.cards.size).to eq(52)
    end

    it 'has a default deck of unique cards' do
      expect(deck.cards.uniq).to eq(deck.cards)
    end

    it 'can be initialized with particular cards' do
      expect(deck2.cards.count).to eq(2)
      expect(deck2.cards[0]).to eq(Card.new(:clubs, 3))
    end
  end

  # dealing cards
  describe '#take(n)' do
    it 'draws multiple cards from the deck' do
      expect(deck.take(2)).to eq(
        [Card.new(:clubs, 2), Card.new(:clubs, 3)])
    end
    it 'draws cards from the front of the deck' do
      expect(deck2.take(1).first).to eq(Card.new(:clubs, 3))
      expect(deck2.take(1).first).to eq(Card.new(:diamonds, 4))
    end
  end

end
