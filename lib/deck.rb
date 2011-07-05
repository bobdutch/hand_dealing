class Deck

  attr_reader :cards

  def initialize
    @cards = Card::RANKS.product(Card::SUITS).collect { |c| Card.new(c[1],c[0]) }
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
