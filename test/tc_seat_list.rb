require 'test/unit'
require "#{File.dirname(__FILE__)}/../lib/seat_list.rb"
require "#{File.dirname(__FILE__)}/../lib/player.rb"

class TC_SeatList < Test::Unit::TestCase

  def setup
    @list = SeatList.new
  end

  def test_add_player
    orig_count = @list.count
    @list.add_player(Player.new(orig_count + 1))
    assert_equal(orig_count + 1, @list.count)
  end

  def test_current_and_advance
    #start with no players
    assert_equal(@list.current, nil)

    #add one and make sure he/she's current
    @list.add_player(Player.new(1))
    assert_instance_of(Player, @list.current)
    first_current = @list.current

    #advance a list of one shouldn't change current
    assert_equal(@list.current, first_current)
    @list.advance
    assert_equal(@list.current, first_current)

    #add another and advance
    @list.add_player(Player.new(2))
    assert_equal(@list.current, first_current)
    @list.advance
    assert_not_equal(@list.current, first_current)

    #make sure it loops back to the first player
    @list.advance
    assert_equal(@list.current, first_current)
  end


  def test_count
    assert_equal(0, @list.count)
    players_to_add = 5
    players_to_add.times do |i|
      @list.add_player(Player.new(i))
    end
    assert_equal(players_to_add, @list.count)
  end

  def test_any?
    flunk
  end

  def test_to_s
    flunk
  end
 
end
