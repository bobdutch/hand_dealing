#!/usr/bin/env ruby
require 'test/unit'
require "#{File.dirname(__FILE__)}/../lib/table.rb"
require "#{File.dirname(__FILE__)}/../lib/player.rb"

class TC_Table < Test::Unit::TestCase

  def setup
    @list = Table.new
  end

  def test_add_player
    orig_count = @list.count_players
    @list.add_player(Player.new)
    assert_equal(orig_count + 1, @list.count_players)
  end

  def test_current_and_advance
    #start with no players
    assert_equal(@list.current_player, nil)

    #add one and make sure he/she's current
    player = Player.new
    @list.add_player(player)
    assert_instance_of(Player, @list.current_player)
    assert_equal(player, @list.current_player)
    first_current = @list.current_player

    #advance a list of one shouldn't change current
    assert_equal(@list.current_player, first_current)
    @list.advance_turn
    assert_equal(@list.current_player, first_current)

    #add another and advance
    @list.add_player(Player.new)
    assert_equal(@list.current_player, first_current)
    @list.advance_turn
    assert_not_equal(@list.current_player, first_current)

    #make sure it loops back to the first player
    @list.advance_turn
    assert_equal(@list.current_player, first_current)
  end


  def test_count_players
    assert_equal(0, @list.count_players)
    players_to_add = 5
    players_to_add.times do
      @list.add_player(Player.new)
    end
    assert_equal(players_to_add, @list.count_players)
  end
end
