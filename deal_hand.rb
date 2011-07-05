#!/usr/bin/env ruby
$LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')
require 'player'
require 'game'
require 'card'
require 'deck'
require 'seat_list'

begin
  unless @num_players
    print "Enter the number of players: "
    @num_players = gets.to_i
  end

  unless @cards_per_hand
    print "Enter the number of cards in a hand: "
    @cards_per_hand = gets.to_i
  end
  
  #for sanity if the user enters values that would require
  #one thousand times the cards of a standard deck then abort
  if(@num_players*@cards_per_hand > 52000)
    puts "Pick some reasonable values and try again"
    raise Interrupt
  end

  g = Game.new(@num_players, @cards_per_hand)
  puts g.players


rescue NumPlayersError => e
  @num_players = nil
  puts "\n" + e
  retry

rescue CardsPerHandError => e
  @cards_per_hand = nil
  puts "\n" + e
  retry

rescue Interrupt
  puts "\nGoodbye."
end

