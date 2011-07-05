#!/usr/bin/env ruby
require 'test/unit'
require "#{File.dirname(__FILE__)}/../lib/player.rb"

class TC_Player < Test::Unit::TestCase
  def setup
    @player = Player.new
  end

  def test_take_card
    orig_count = @player.num_cards
    @player.take_card(Card.new('s',2))
    assert_equal(orig_count + 1, @player.num_cards)
  end
end
