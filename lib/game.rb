#An instance of Game sets up and controls the flow of the game
#by acting as dealer, score keeper, etc.
class Game

  attr_reader :players, :deck, :num_players, :cards_per_hand 

  #set up a new game
  def initialize(num_players, cards_per_hand)
    @num_players = num_players.to_i
    @cards_per_hand = cards_per_hand.to_i

    #validate
    if @num_players == 0
      message = 'Number of players must be a positive number'
      raise NumPlayersError.new(message)
    end

    if @cards_per_hand == 0
      message = 'Cards per hand must be a positive number'
      raise CardsPerHandError.new(message)
    end

    @deck = Deck.new

    @players = SeatList.new
    @num_players.times do
      @players.add_player(Player.new
    end

    #shuffle
    @deck.shuffle!
    deal
  end
  
  #give cards to the players until their hands are full
  #or the deck is empty
  def deal
    while (!@deck.empty? && @players.any? { |p| p.num_cards < self.cards_per_hand }) do
      @players.current.get_card(@deck.draw_card)
      @players.advance
    end
  end
end

#raise an error of this type if there is
#invalid input for Game#num_players= 
class NumPlayersError < ArgumentError
end

#raise an error of this type if there is
#invalid input for Game#cards_per_hand= 
class CardsPerHandError < ArgumentError
end
