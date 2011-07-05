#a collection class for Players, represents the game table
#the players are contained in array where the player at the first
#position is in play
#the seat_counter keeps track of the "seats" at the table
#the seat of a player is managed by the Player#position method
class Table
  def initialize
    @seats = Array.new
    @seat_counter = 0
  end

  #add a player to the table, increment the seat_counter
  def add_player(player)
    player.position = @seat_counter = @seat_counter + 1 
    @seats.push(player)
    self
  end

  #return the player who's turn is in play
  def current
    @seats.first
  end

  #advance play so that the next player is ready for his/her turn
  #the current player gets moved to the end of the list
  def advance
    @seats.push(@seats.shift)
    self
  end

  #perform Array#any? on the players at the table
  def any?(*args, &block)
    @seats.any?(*args, &block)
  end

  #perform Array#each on the players at the table
  def each(*args, &block)
    @seats.each(*args, &block)
  end

  #return the number of active players at the table
  def count
    @seats.count
  end
  
  #prints out players and the cards in their hands
  def to_s
    @seats.sort_by {|p| p.position}.collect do |player|
      player.to_s
    end.join("\n")
  end
end
