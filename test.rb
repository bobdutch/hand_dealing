ALLOWED_PLAYERS = 1..9

SUITS = %w(d c s h)

CARDS = (2..9).to_a + %w(T J Q K A)

DECK = CARDS.product(SUITS).collect { |c| "#{c[0]}#{c[1]}"}

puts DECK


class Game

  def initialize(players, cards)
    #validate input
    #shuffle
    #deal
    puts players
  end

  def shuffle_deck
  end

  def deal
  end
end

Game.new(6, 4)
