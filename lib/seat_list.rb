class SeatList
  def initialize
    @seats = Array.new
  end

  def add_player(player)
    @seats.push(player)
    self
  end

  def current
    @seats.first
  end

  def advance
    @seats.push(@seats.shift)
    self
  end

  def any?(*args, &block)
    @seats.any?(*args, &block)
  end

  def each(*args, &block)
    @seats.each(*args, &block)
  end

  def count
    @seats.count
  end

  def to_s
    str = ''
    @seats.sort_by {|p| p.position}.each do |p|
      str += "Seat #{p.position}: #{p.hand.join(', ')}\n"
    end
    str
  end
end
