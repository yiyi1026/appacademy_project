require_relative "piece"
require_relative "null_piece"
require_relative "cursor"

class Board

  attr_accessor :board

  def initialize
    @board = Array.new(8) { Array.new(8, NullPiece.instance) }
  end

  def empty?(pos)
    self[pos].class == NullPiece

  end

  def move_piece(start_pos, end_pos)
    check_for_valid = valid_move?(start_pos) && valid_move?(end_pos)
    raise "Position Error" unless check_for_valid &&
    self.empty?(end_pos) && !self.empty?(start_pos)
    rescue
      "Wrong position input! Try again"

  end

  def valid_move?(pos)
    pos.each do |location|
      return false unless (0..7).include?(location)
    end
    true
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
