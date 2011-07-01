require 'test/unit'
require "#{File.dirname(__FILE__)}/../lib/deck.rb"
require "#{File.dirname(__FILE__)}/../lib/card.rb"

class TC_Deck < Test::Unit::TestCase
  
  def setup
    @deck = Deck.new
  end

  def test_draw_card
    assert_not_equal(@deck.cards.length, 0)
    start_length = @deck.cards.length
    @deck.draw_card
    assert_equal(start_length - 1, @deck.cards.length)
    assert_not_equal(start_length, @deck.cards.length)
  end

  #there is a 1/52 chance that a shuffled deck could be the same
  #so this test is dubious
  def test_shuffle
    pre_shuffle = @deck#.clone
    @deck.shuffle
    assert_not_equal(@deck, pre_shuffle, "these are the same?")
  end

  def test_empty
    assert_not_equal(@deck.cards.length, 0)
    @deck.cards.length.times do
      assert(!@deck.empty?)
      @deck.draw_card
    end
    assert(@deck.empty?)
  end
end

