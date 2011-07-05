class Card
 SUITS = %w(d c s h)
 RANKS = (2..9).to_a + %w(T J Q K A)

 attr_reader :suit, :rank

  def initialize(suit, rank)
    unless SUITS.include?(suit) and RANKS.include?(rank)
      raise ArgumentError
    end
    @suit = suit
    @rank = rank
  end

  def to_s
    [self.rank,self.suit].join
  end
end
