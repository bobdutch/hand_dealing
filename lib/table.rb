require File.expand_path(File.join(File.dirname(__FILE__), 'player.rb'))
#a collection class for Players, represents the game table
#a table is an array of arrays where each array has two elements:
#the seat position of the player, and the player object itself
#in the first "seat" of the Array is in play
#the seat_counter keeps track of the numer of seats at the table
class Table
  def initialize
    @seats = Array.new
    @seat_counter = 0
  end

  #add a player to the table, increment the seat_counter
  def add_player(player)
    @seat_counter = @seat_counter + 1 
    @seats.push([@seat_counter, player])
    self
  end

  #return the player who's turn is in play
  def current_player
    return nil if @seats.empty?
    @seats.first.last
  end

  #advance play so that the next player is ready for his/her turn
  #the current player gets moved to the end of the list
  def advance_turn
    @seats.push(@seats.shift)
    self
  end

  #an array of the active player objects
  def players
    @seats.collect {|position, player| player }
  end
  
  #prints out players and the cards in their hands
  def to_s
    @seats.sort_by {|position, player| position}.collect do |position, player|
      "Seat #{position}: #{player.to_s}"
    end.join("\n")
  end
end
