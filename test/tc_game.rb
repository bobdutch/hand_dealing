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
    }

    outside_player_range = {
      0  => 10,
      10 => 1,
      99 => 5,
    }

    too_many_cards = {
      1 => 53,
      2 => 27,
      9 => 6,
    }

    good_vals.each do |players, cards|
      @game = Game.new(players, cards)
      assert_instance_of(Game, @game)
    end

    outside_player_range.each do |players, cards|
      assert(!Game::ALLOWED_PLAYERS.include?(players))
      assert_raise(ArgumentError, Game.new(players, cards))
      #check for error message
    end
    
  end

  def test_deal
    #initialize game

    #test count of cards in deck + cards in hand

    #make sure another deal doesn't change that

    #remove some cards from players

    #deal again
    flunk
  end

end

