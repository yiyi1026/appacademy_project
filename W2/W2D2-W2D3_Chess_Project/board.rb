require_relative "piece"
require_relative "null_piece"
require_relative "sliding_pieces"
require_relative "stepping_pieces"
require_relative "cursor"

class Board

  attr_accessor :board

  def initialize
    @board = Array.new(8) { Array.new(8, NullPiece.instance) }


    @board[7][0] = Rook.new(:white)
    @board[7][7] = Rook.new(:white)

    @board[7][1] = Knight.new(:white)
    @board[7][6] = Knight.new(:white)

    @board[7][2] = Bishop.new(:white)
    @board[7][5] = Bishop.new(:white)

    @board[7][3] = Queen.new(:white)
    @board[7][4] = King.new(:white)


    @board[0][0] = Rook.new(:black)
    @board[0][7] = Rook.new(:black)

    @board[0][1] = Knight.new(:black)
    @board[0][6] = Knight.new(:black)

    @board[0][2] = Bishop.new(:black)
    @board[0][5] = Bishop.new(:black)

    @board[0][3] = Queen.new(:black)
    @board[0][4] = King.new(:black)

    #

  end

  def empty?(pos)
    self[pos].class == NullPiece
  end

  def move_piece(start_pos, end_pos)
    check_for_valid = valid_move?(start_pos) && valid_move?(end_pos)
    raise "Position Error" unless check_for_valid &&
    self.empty?(end_pos) && !self.empty?(start_pos)

    if self[start_pos].move(start_pos, end_pos)
      self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
    end

    rescue
      "Wrong position input! Try again"
  end

  def valid_move?(pos)
    pos.each do |location|
      return false unless (0..7).include?(location)
    end
    true
  end

  def in_bounds(pos)
    valid_move?(pos)
  end

  def [](pos)
    x, y = pos
    @board[x][y]
  end

  def []=(pos, piece)
    x, y = pos
    @board[x][y] = piece
  end

end
