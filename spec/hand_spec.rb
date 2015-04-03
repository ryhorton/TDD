require 'rspec'
require 'hand'
require 'card'

describe Hand do

  subject(:hand1) { Hand.new }

  describe '#initialize' do
    it 'initializes with an empty hand' do
      expect(hand1.hand.empty?).to be true
    end
  end

  describe '#add_cards' do
    subject(:card) { Card.new(:clubs, 3) }
    let(:card2) { Card.new(:diamonds, 10) }
    let(:card3) { Card.new(:hearts, 10) }

    it 'adds one card to the hand' do
      hand1.add_cards(card3)
      expect(hand1.hand.include?(card3)).to be true
    end

    it 'adds multiple cards to the hand' do
      hand1.add_cards([card, card2])
      expect(hand1.hand.include?(card)).to be true
      expect(hand1.hand.include?(card2)).to be true
    end
  end

  let(:hand2) do
    Hand.new([
      Card.new(:clubs, 10),
      Card.new(:diamonds, 10),
      Card.new(:diamonds, 8),
      Card.new(:clubs, 8),
      Card.new(:hearts, 8)
    ])
  end

  let(:hand3) do
    Hand.new([
      Card.new(:clubs, 14),
      Card.new(:clubs, 13),
      Card.new(:clubs, 12),
      Card.new(:clubs, 11),
      Card.new(:clubs, 10)
    ])
  end

  let(:hand4) do
    Hand.new([
      Card.new(:clubs, 14),
      Card.new(:diamonds, 14),
      Card.new(:hearts, 14),
      Card.new(:spades, 14),
      Card.new(:clubs, 10)
    ])
  end

  describe '#highest_card_value' do
    it 'returns the value of the highest value card' do
      expect(hand2.highest_card_value).to eq(10)
      expect(hand3.highest_card_value).to eq(14)
    end
  end

  describe '#has_pair?' do
    it 'returns true if the hand includes a pair' do
      expect(hand2.has_pair?).to be true
      expect(hand3.has_pair?).to be false
    end
  end

  describe '#has_two_pairs?' do
    it 'returns true if the hand includes two pairs' do
      expect(hand2.has_two_pairs?).to be true
      expect(hand3.has_two_pairs?).to be false
    end
  end

  describe '#has_three_of_a_kind?' do
    it 'returns true if the hand includes three of a kind' do
      expect(hand2.has_three_of_a_kind?).to be true
      expect(hand3.has_three_of_a_kind?).to be false
    end
  end
  describe '#has_straight?' do
    it 'returns true if the hand includes a straight' do
      expect(hand2.has_straight?).to be false
      expect(hand3.has_straight?).to be true
    end
  end

  describe '#has_flush?' do
    # all one suit
    it 'returns true if the hand includes a flush' do
      expect(hand2.has_flush?).to be false
      expect(hand3.has_flush?).to be true
    end
  end

  describe '#has_full_house?' do
    it 'returns true if the hand includes a full house' do
      expect(hand2.has_full_house?).to be true
      expect(hand3.has_full_house?).to be false
    end
  end

  describe '#has_four_of_a_kind?' do
    it 'returns true if the hand includes four of a kind' do
      expect(hand4.has_four_of_a_kind?).to be true
      expect(hand3.has_four_of_a_kind?).to be false
    end
  end

  describe '#has_straight_flush?' do
    it 'returns true if the hand includes a straight flush' do
      expect(hand2.has_straight_flush?).to be false
      expect(hand3.has_straight_flush?).to be true
    end
  end

  describe '#has_royal_flush?' do
    it 'returns true if the hand includes a royal flush' do
      expect(hand2.has_royal_flush?).to be false
      expect(hand3.has_royal_flush?).to be true
    end
  end

end
