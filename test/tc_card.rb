require 'test/unit'
require "#{File.dirname(__FILE__)}/../lib/card.rb"

class TC_Card < Test::Unit::TestCase
  def setup
    @card = Card.new(Deck::SUITS[rand(Deck::SUITS.size)], Deck::RANKS[rand(Deck::RANKS.size)]) 
  end

  def test_to_s
    rank, suit = @card.to_s.split('')
    assert_equal(suit, @card.suit)
    assert_equal(rank, @card.rank)
  end
end
