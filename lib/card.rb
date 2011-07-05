class Card
 SUITS = %w(d c s h)
 RANKS = (2..9).to_a + %w(T J Q K A)

 attr_reader :suit, :rank

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end

  def to_s
    [self.rank,self.suit].join
  end
end
