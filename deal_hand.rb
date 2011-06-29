#!/usr/bin/env ruby
$LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')
require 'player'
require 'game'
require 'card'
require 'deck'
require 'seat_list'


#TODO get input from command line

g = Game.new(6, 4)
g.deal
puts g.players

