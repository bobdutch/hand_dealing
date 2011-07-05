class Player
  attr_accessor :hand, :position

  def initialize
    self.hand = Array.new
  end

  def num_cards
    self.hand.length
  end

  def get_card(card)
    self.hand << card
  end
end

