require 'test/unit'
require "#{File.dirname(__FILE__)}/../lib/card.rb"

class TC_Card < Test::Unit::TestCase
  def setup
    @card = Card.new(Card::SUITS[rand(Card::SUITS.size)], Card::RANKS[rand(Card::RANKS.size)]) 
  end

  #we shouldn't be able to change a card's suit or rank
  def test_change_suit_or_rank
    assert_raise(NoMethodError) do
      @cart.suit = 'anything'
    end
    assert_raise(NoMethodError) do
      @cart.rank = 'anything'
    end
  end

  def test_to_s
    rank, suit = @card.to_s.split('')
    assert_equal(suit, @card.suit)
    assert_equal(rank, @card.rank.to_s)
  end
end
