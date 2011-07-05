class Player
  attr_accessor :hand
  attr_reader :position

  def initialize(position)
    self.hand = Array.new
    @position = position
  end

  def num_cards
    self.hand.length
  end

  def get_card(card)
    self.hand << card
  end
end

