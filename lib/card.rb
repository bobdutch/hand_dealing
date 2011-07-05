#An instance of Card represents a standard playing card
#in a 52-card deck.
class Card
 SUITS = %w(d c s h)
 RANKS = (2..9).to_a + %w(T J Q K A)

 attr_reader :suit, :rank

  #a new card: suit and rank are required parameters
  def initialize(suit, rank)
    unless SUITS.include?(suit) and RANKS.include?(rank)
      raise ArgumentError
    end
    @suit = suit
    @rank = rank
  end

  #string representation of card
  #eg. a card with #rank J and #suit h would be "Jh"
  def to_s
    [self.rank,self.suit].join
  end
end
