#!/usr/bin/env ruby
require 'test/unit'
require File.expand_path("#{File.dirname(__FILE__)}/../lib/card.rb")

#test cases for Card model
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

  def test_valid_suits_and_ranks
    #good values
    assert_nothing_raised(ArgumentError) do
      Card::SUITS.each do |suit|
        Card::RANKS.each do |rank|
          Card.new(suit, rank)
        end
      end
    end

    #mix of bad values
    [['d',1],['f',2],['f',1]].each do |suit, rank|
      assert_raise(ArgumentError) do
        Card.new(suit,rank)
      end
    end
  end

  def test_to_s
    rank, suit = @card.to_s.split('')
    assert_equal(suit, @card.suit)
    assert_equal(rank, @card.rank.to_s)
  end
end
