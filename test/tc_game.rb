#!/usr/bin/env ruby
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
      assert_nothing_raised(ArgumentError) do
        @game = Game.new(players, cards)
      end
      assert_instance_of(Game, @game)
    end

    bad_player_vals.each do |players, cards|
      assert_raise(NumPlayersError) do
        @game = Game.new(players, cards)
      end
    end

    bad_card_vals.each do |players, cards|
      assert_raise(CardsPerHandError) do
        @game = Game.new(players, cards)
      end
    end
   
  end

  def test_deal
    #initialize game
    @game = Game.new(5,6)

    #test count of cards in deck + cards in hand
    cards_in_deck = @game.deck.cards.count
    cards_in_hands = 0
    @game.players.each {|p| cards_in_hands += p.num_cards }
    total_cards = cards_in_hands + cards_in_deck

    #these tests assume a game intialized with a full standard deck
    assert_equal(total_cards, 52)

    #this deal shouldn't add any more cards because
    #all hands are full
    @game.deal
    assert_equal(cards_in_deck, @game.deck.cards.count)


    #remove a card from each player's hand
    @game.players.each { |p| p.hand.pop }
    new_cards_in_hands = 0
    @game.players.each {|p| new_cards_in_hands += p.num_cards }

    #cards in hands should be number of players fewer
    assert(new_cards_in_hands < cards_in_hands)
    assert_equal(new_cards_in_hands + @game.players.count, cards_in_hands) 
    #total cards should also be number of players fewer
    assert_equal(new_cards_in_hands + @game.deck.cards.count + @game.players.count, total_cards) 

    #deal until the deck is empty
    while(!@game.deck.empty?) do
      @game.players.each { |p| p.hand.pop }
      @game.deal
    end
    assert_equal(@game.deck.cards.count, 0)


  end

  def test_players_to_s
    test_arguments = [[5,6],[1,10],[25,10], [53,10]]
    test_arguments.each do |num_players, cards_per_hand|
      @game = Game.new(num_players, cards_per_hand)
      seats = @game.players.to_s.split("\n")
      position = 0
      seats.each do |seat|
        assert_match(/^Seat (\d+): ([2-9TJQKA]{1}[cshd]{1}, {1})*([2-9TJQKA]{1}[cshd]{1})?$/, seat)
      end
    end
  end
 
end

