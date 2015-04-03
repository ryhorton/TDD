require 'card'

class Deck

  attr_reader :cards

  def self.all_cards
    deck = []
    Card::SUIT_STRINGS.keys.each do |suit|
      Card::POKER_VALUES.values.each do |value|
        deck << Card.new(suit, value)
      end
    end

    deck
  end

  def initialize(cards = Deck.all_cards)
    @cards = cards
  end

  def take(n)
    @cards.shift(n)
  end


end
