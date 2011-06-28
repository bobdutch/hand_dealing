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
        @players[i] ||= Array.new
        @players[i] << @deck.pop
      end
    end

    #print it out
    @players.sort.each do |i,p|
      puts "#{i}: #{p.join(' ')}"
    end
  end
end

Game.new(6, 4)
