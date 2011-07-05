require 'test/unit'
require "#{File.dirname(__FILE__)}/../lib/player.rb"

class TC_Player < Test::Unit::TestCase
  def setup
    @player = Player.new
  end

  def test_get_card
    orig_count = @player.num_cards
    @player.get_card(Card.new('s','2'))
    assert_equal(orig_count + 1, @player.num_cards)
  end
end
