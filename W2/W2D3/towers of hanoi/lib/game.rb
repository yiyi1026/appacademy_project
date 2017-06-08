class Game
  attr_accessor :piles

  def initialize
    @piles = [[3,2,1],[],[]]
  end

  def move(start_pos, end_pos)
    disc = self[start_pos].pop
    self[end_pos] << disc
  end

  def [](pos)
    piles[pos]
  end

  def []=(pos,value)
    piles[pos] = value
  end

  def won?
    return true if self.piles[-1] == [3,2,1]
    false
  end
end
