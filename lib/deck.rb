class Deck
  SUITS = %w(d c s h)

  RANKS = (2..9).to_a + %w(T J Q K A)

  attr_reader :cards

  def initialize
    @cards = RANKS.product(SUITS).collect { |c| Card.new(c[1],c[0]) }
  end

  def shuffle
    @cards = self.cards.sort_by { rand }
  end

  def empty?
    self.cards.empty?
  end

  def draw_card
    self.cards.pop
  end
end
