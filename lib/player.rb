#represents a person who is playing the game
class Player
  attr_reader :hand

  #create a new person with an empty hand
  def initialize
    @hand = Array.new
  end

  #return the number of cards in the player's hand
  def num_cards
    @hand.length
  end

  #put the specified card in the player's hand
  def take_card(card)
    @hand << card
  end

  #print out contents of the player's hand
  def to_s
    @hand.join(', ')
  end
end

