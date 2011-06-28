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
    while (!@deck.cards.empty? && @players.any? { |i,p| p.hand.length < self.cards_per_hand }) do
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
