class Board
  attr_accessor :row, :col

  def self.empty_grid(row, col)
    d = Array.new(row) { Array.new(col, nil) }
    (0...row).each do |i|
      (0...col).each do |j|
        d[i][j] = Tile.new
      end
    end
    d
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end
  def []=(pos, value)
    x, y = pos
    @grid[x][y]=value
  end

  def initialize(row = 9, col = 9)
    @grid = Board.empty_grid(row, col)
    @row = row
    @col = col
    set_bombs
  end

  def valid_pos?(pos)
    i, j = pos
    if  i >= 0 && i < row && j >= 0 && j < col
      return !revealed?(pos)
    end

  end

  def neighbors(pos)
    row_idx, col_idx = pos
    neighbors = []
    (-1..1).each do |i|
      (-1..1).each do |j|
        unless i == 0 && j == 0
          pos = [row_idx + i, col_idx + j]
          neighbors << pos if valid_pos?(pos)
        end
      end
    end
    neighbors
  end

  def set_bombs(n = 1)
    while n > 0
      r = rand(@row)
      c = rand(@col)
      pos = [r,c]
      if valid_pos?(pos)
        if self[pos].value != -1
          self[pos].value = -1
          n -= 1
        end
      end
    end


    (0...row).each do |i|
      (0...col).each do |j|
        v = neighbors([i,j]).count do |pos|
          self[pos].value == -1
        end
        self[[i,j]].value = v unless has_mine?([i,j])
      end
    end


  end

  def revealed?(pos)
    !self[pos].hidden
  end

  def reveal(pos)
    # die
    if has_mine?(pos)
      self[pos].value = -2
    end
    self[pos].hidden = false
    if self[pos].value == 0
      neighbors(pos).reject{|neighbor| revealed?(neighbor)}.each{ |neighbor| reveal(neighbor)}
    end
  end

  def flag(pos)
    self[pos].flag = true
    self[pos].hidden = false
  end

  def die?
    (0...row).each do |i|
      (0...col).each do |j|
        return true if self[[i,j]].value == -2
      end
    end
    false
  end

  def win?
    (0...row).each do |i|
      (0...col).each do |j|
        return false if self[[i,j]].hidden
      end
    end
    true
  end

  def render
    (0...row).each do |i|
      (0...col).each do |j|

        s = case self[[i,j]].value
              when -1
                'F'
              when 0
                '_'
              else
                self[[i,j]].value.to_s
            end
        if self[[i,j]].hidden
          print '* '
        else
          print s + ' '
        end

      end
      print "\n"
    end
  end

  def has_mine?(pos)
    self[pos].value == -1
  end
end
