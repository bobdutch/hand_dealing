#represents a person who is playing the game
#the position method represents the seating order of the player
class Player
  attr_accessor :hand, :position

  #create a new person with an empty hand
  def initialize
    self.hand = Array.new
  end

  #return the number of cards in the player's hand
  def num_cards
    self.hand.length
  end

  #put the specified card in the player's hand
  def get_card(card)
    self.hand << card
  end

  #print out the player's seat position and contents of hand
  def to_s
    "Seat #{self.position}: #{self.hand.join(', ')}"
  end
end

