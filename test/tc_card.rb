require 'test/unit'
require "#{File.dirname(__FILE__)}/../lib/card.rb"

class TC_Card < Test::Unit::TestCase
  def setup
    @card = Card.new(Deck::SUITS[rand(Deck::SUITS.size)], Deck::RANKS[rand(Deck::RANKS.size)]) 
  end

  #we shouldn't be able to change a card's suit or rank
  def test_change_suit_or_rank
    assert_raise(NoMethodError) do
      @cart.suit = 's'
    end
    assert_raise(NoMethodError) do
      @cart.rank = 's'
    end
  end

  def test_to_s
    rank, suit = @card.to_s.split('')
    assert_equal(suit, @card.suit)
    assert_equal(rank, @card.rank.to_s)
  end
end
