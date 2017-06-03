class Board

  def self.empty_grid(row, col)
    Array.new(row) { Array.new(col, nil) }
  end

  def initialize(row = 9, col = 9)
    @grid = self.empty_grid(row, col)
    @row = row
    @col = col
  end

  def valid_pos?(pos)
    i, j = pos
    i >= 0 && i <= row && j >= 0 && j <= col
  end

  def neighbors(pos)
    row_idx, col_idx = pos
    neighbors = []
    (-1..1).each do |i|
      (-1..1).each do |j|
        unless i == 0 && j == 0
          neighbors << [row_idx + i, col_idx + j]
        end
      end
    end
    neighbors
  end

  def get_bombs(n)
    bombs = []
    until bombs.length == n
      i = rand(row)
      j = rand(col)
      bombs << [i, j] unless bombs.include?([i, j])
    end
    bombs
  end

  def set_bombs

  end

  def revealed?(pos)
    i, j = pos
    !grid[i][j].hidden
  end

end
