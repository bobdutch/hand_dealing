#!/usr/bin/env ruby
$LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')
require 'player'
require 'game'
require 'card'
require 'deck'
require 'seat_list'


#TODO get input from command line
print "Enter the number of players: "
num_players = gets.to_i
print "Enter the number of cards in a hand: "
cards_per_hand = gets.to_i

g = Game.new(num_players, cards_per_hand)
g.deal
puts g.players

