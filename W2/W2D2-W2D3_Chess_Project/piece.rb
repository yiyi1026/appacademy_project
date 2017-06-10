require_relative "board"
MOVES = {
  left: [0, -1],
  right: [0, 1],
  up: [-1, 0],
  down: [1, 0],
  upleft: [-1, -1],
  upright: [-1, 1],
  downleft: [1, -1],
  downright: [1, 1]
}
class Piece

  def initialize(board)
    @board = board
  end


end

# module Slide # queen= all, rook = x,y, bishop = diag
#   def row_move(start_pos, end_pos)
#     x = same, no y
#   end
#
#   def col_move(start_pos, end_pos)
#     y = same, no x
#   end
#
#   def diag_move(start_pos, end_pos)
#     +num, +num or -num, -num
#   end
# end
#
# module Step # king, knight
# end
#
# module Pawns
#
# end
