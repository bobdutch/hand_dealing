require 'test/unit'
require "#{File.dirname(__FILE__)}/../lib/deck.rb"
require "#{File.dirname(__FILE__)}/../lib/card.rb"

class TC_Deck < Test::Unit::TestCase
  
  def setup
    @deck = Deck.new
  end

  def test_draw_card
    start_length = @deck.cards.length
    @deck.draw_card
    assert_equal(start_length - 1, @deck.cards.length)
    assert_not_equal(start_length, @deck.cards.length)
  end

  def test_shuffle
    flunk
  end

  def test_empty
    flunk
  end
end

