#represents a person who is playing the game
class Player
  attr_accessor :hand

  #create a new person with an empty hand
  def initialize
    self.hand = Array.new
  end

  #return the number of cards in the player's hand
  def num_cards
    self.hand.length
  end

  #put the specified card in the player's hand
  def take_card(card)
    self.hand << card
  end

  #print out contents of the player's hand
  def to_s
    self.hand.join(', ')
  end
end

