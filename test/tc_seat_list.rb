require 'test/unit'
require "#{File.dirname(__FILE__)}/../lib/seat_list.rb"
require "#{File.dirname(__FILE__)}/../lib/player.rb"

class TC_SeatList < Test::Unit::TestCase

  def setup
    @list = SeatList.new
    5.times do |i|
      @list.add_player(Player.new(i))
    end
  end

  def test_add_player
    orig_count = @list.count
    @list.add_player(Player.new(orig_count + 1))
    assert_equal(orig_count + 1, @list.count)
  end

  def test_advance
    flunk
  end

  def test_count
    flunk
  end

  def test_any?
    flunk
  end

  def test_to_s
    flunk
  end
 
end
