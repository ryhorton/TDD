class Hand

  attr_reader :hand

  def initialize(hand = [])
    @hand = hand
  end

  def add_cards(cards)
    cards = [cards] unless cards.is_a?(Array)
    @hand.concat(cards)
  end

  def calculate
  end

  def highest_card_value
    result = 0
    @hand.each do |card|
      result = card.value if card.value > result
    end

    result
  end

  def card_values
    # @hand.map { |card| card.value }
    result = Hash.new(0)
    @hand.each do |card|
      result[card.value] += 1
    end
    result
  end

  def has_pair?
    # return true unless values == values.uniq
    #
    # false

    card_values.any? { |key, value| value >= 2 }
  end

  def has_two_pairs?
    # return false unless has_pair?
    # pair_values = card_values.reject(card_values.uniq)
    # puts "#{pair_values}, #{card_values}, #{card_values.uniq}"
    # return true if pair_values.count == 2
    # false

    card_values.any? { |key, value| value >= 2 }
    count = 0
    card_values.values.each do |value|
      count += 1 if value >= 2
    end

    count >= 2
  end

  def has_three_of_a_kind?
    card_values.any? { |key, value| value >= 3 }
  end

  def has_straight?
  end

  def has_flush?
    # all one suit
  end

  def has_full_house?

  end

  def has_four_of_a_kind?
    result = Hash.new(0)
    @hand.each do |card|
      result[card.value] += 1
    end

    result.any? { |key, value| value >= 4 }
  end

  def has_straight_flush?

  end

  def has_royal_flush?

  end

end
