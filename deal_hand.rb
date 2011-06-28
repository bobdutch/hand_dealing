ALLOWED_PLAYERS = 1..9

SUITS = %w(d c s h)

CARDS = (2..9).to_a + %w(T J Q K A)

DECK = CARDS.product(SUITS).collect { |c| "#{c[0]}#{c[1]}"}


class Game

  def initialize(players, cards)
    #validate input
    #shuffle
    @deck = DECK.sort_by { rand }
    @players = Hash.new()
    #deal
    cards.times do
      (1..players).each do |i|
        @players[i] ||= Player.new
        @players[i].hand << @deck.pop
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
    @hand = Array.new
  end
end

Game.new(6, 4)
