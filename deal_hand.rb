class Game

  ALLOWED_PLAYERS = 1..9

  attr_accessor :num_players, :cards_per_hand

  def initialize(num_players, cards_per_hand)
    #validate input

    self.num_players = num_players
    self.cards_per_hand = cards_per_hand


    @players = Hash.new
    (1..num_players).each do |i|
      @players[i] = Player.new
    end

    #shuffle
    @deck = Deck.new
    @deck.shuffle
  end

  def deal
    while @players.any? { |i,p| p.hand.length < self.cards_per_hand } do
      (1..num_players).each do |i|
        @players[i].hand << @deck.draw_card
      end
    end
  end

  def to_s
    str = ''
    @players.sort.each do |i,p|
      str += "Seat #{i}: #{p.hand.join(', ')}\n"
    end
    str
  end
end

class Player
  attr_accessor :hand

  def initialize
    self.hand = Array.new
  end
end

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

class Deck
  SUITS = %w(d c s h)

  RANKS = (2..9).to_a + %w(T J Q K A)

  attr_accessor :cards

  def initialize
    self.cards = RANKS.product(SUITS).collect { |c| Card.new(c[1],c[0]) }
  end

  def shuffle
    self.cards = self.cards.sort_by { rand }
  end

  def draw_card
    self.cards.pop
  end
end

#TODO get input from command line

g = Game.new(6, 4)
g.deal
puts g

