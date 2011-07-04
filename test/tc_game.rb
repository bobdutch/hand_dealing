require 'test/unit'
require "#{File.dirname(__FILE__)}/../lib/game.rb"
require "#{File.dirname(__FILE__)}/../lib/seat_list.rb"
require "#{File.dirname(__FILE__)}/../lib/player.rb"
require "#{File.dirname(__FILE__)}/../lib/deck.rb"
require "#{File.dirname(__FILE__)}/../lib/card.rb"

class TC_Game < Test::Unit::TestCase

  def test_new
    assert_nil(@game)

    #players, cards
    good_vals = {
      1 => 1,
      2 => 5,
      9 => 5,
      52 => 52,
      100 => 100,
    }

    bad_player_vals = {
      'foo' => 5,
      0  => 10,
    }

    bad_card_vals = {
      10 => 'foo',
      10 => 0,
    }

    good_vals.each do |players, cards|
      @game = Game.new(players, cards)
      assert_instance_of(Game, @game)
    end

    bad_player_vals.each do |players, cards|
      assert_raise(ArgumentError) do
        @game = Game.new(players, cards)
      end
      #check for error message
    end

    bad_card_vals.each do |players, cards|
      assert_raise(ArgumentError) do
        @game = Game.new(players, cards)
      end
      #check for error message
    end
   
  end

  def test_deal
    #initialize game

    #test count of cards in deck + cards in hand

    #make sure another deal doesn't change that

    #remove some cards from players

    #deal again
    flunk("to do")
  end

end

