class Game

  attr_accessor :num_players, :cards_per_hand
  attr_reader :players, :deck 

  #set up a new game
  def initialize(num_players, cards_per_hand)
    self.num_players = num_players.to_i
    self.cards_per_hand = cards_per_hand.to_i

    #validate
    if self.num_players == 0
      message = 'Number of players must be a positive number'
      raise NumPlayersError.new(message)
    end

    if self.cards_per_hand == 0
      message = 'Cards per hand must be a positive number'
      raise CardsPerHandError.new(message)
    end

    @deck = Deck.new

    @players = SeatList.new
    @num_players.times do |i|
      position = i + 1
      @players.add_player(Player.new(position))
    end

    #shuffle
    @deck.shuffle
    deal
  end

  def deal
    while (!@deck.empty? && @players.any? { |p| p.num_cards < self.cards_per_hand }) do
      @players.current.get_card(@deck.draw_card)
      @players.advance
    end
  end
end

class NumPlayersError < ArgumentError
end

class CardsPerHandError < ArgumentError
end
