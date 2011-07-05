require File.expand_path("#{File.dirname(__FILE__)}/../lib/card.rb")

#a container class for Card objects
class Deck

  attr_reader :cards

  #build a full deck of cards
  def initialize
    @cards = Card::RANKS.product(Card::SUITS).collect { |rank, suit| Card.new(suit, rank) }
  end

  #randomize the order of the cards in the deck
  def shuffle!
    @cards = self.cards.sort_by { rand }
  end

  #return true if the deck has no cards
  def empty?
    self.cards.empty?
  end

  #remove the card from the top of the deck and return it
  def draw_card
    self.cards.pop
  end
end
