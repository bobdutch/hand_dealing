class Card
  attr_reader :suit, :rank
  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end

  def to_s
    [self.rank,self.suit].join
  end
end
