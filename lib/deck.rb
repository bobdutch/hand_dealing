class Deck

  attr_reader :cards

  def initialize
    @cards = Card::RANKS.product(Card::SUITS).collect { |rank, suit| Card.new(suit, rank) }
  end

  def shuffle!
    @cards = self.cards.sort_by { rand }
  end

  def empty?
    self.cards.empty?
  end

  def draw_card
    self.cards.pop
  end
end
