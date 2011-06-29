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
    #TODO make sure hand isn't full
    self.hand << card
  end
end

