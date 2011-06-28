class Game

  ALLOWED_PLAYERS = 1..9

  def initialize(players, cards)
    #validate input

    #shuffle
    @deck = Deck.new
    @deck.shuffle

    @players = Hash.new()
    #deal
    cards.times do
      (1..players).each do |i|
        @players[i] ||= Player.new
        @players[i].hand << @deck.draw_card
      end
    end

    #print it out
    @players.sort.each do |i,p|
      puts "#{i}: #{p.hand.join(' ')}"
    end
  end
end

class Player
  attr_accessor :hand

  def initialize
    self.hand = Array.new
  end
end

class Deck
  SUITS = %w(d c s h)

  CLASSES = (2..9).to_a + %w(T J Q K A)

  attr_accessor :cards

  def initialize
    self.cards = CLASSES.product(SUITS).collect { |c| "#{c[0]}#{c[1]}"}
  end

  def shuffle
    self.cards = self.cards.sort_by { rand }
  end

  def draw_card
    @cards.pop
  end
end

Game.new(6, 4)
