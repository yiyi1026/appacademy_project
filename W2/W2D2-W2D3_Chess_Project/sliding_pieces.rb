require_relative 'piece'

module Slide # queen= all, rook = x,y, bishop = diag

  @can_move_diag = false
  @can_move_hor_ver = false

  # only return true or false
  def move(start_pos, end_pos)
    s_x, s_y = start_pos
    e_x, e_y = end_pos
    # return if move to same pos
    return false if s_x == e_x && s_y == e_y

    # move horizontally/vertically
    if @can_move_hor_ver
      if s_x == e_x || s_y == e_y
        return true
      end
    end

    # move diagonal
    if @can_move_diag
      if (s_x - e_x).abs == (s_y - e_y).abs || s_x + e_x == s_y + e_y
        return true
      end
    end

    false
  end

  def move_dirs(dir)
    case dir
      when 'hor_ver'
        @can_move_hor_ver = true
      when 'diag'
        @can_move_diag = true
    end
  end
end

class Rook < Piece
  include Slide

  def initialize(player)
    @player = player
    @symbol = isWhite?? '♖ ': '♜ '
    move_dirs('hor_ver')
  end

end

class Queen < Piece
  include Slide

  def initialize(player)
    @player = player
    @symbol = isWhite?? '♕ ': '♛ '
    move_dirs('hor_ver')
    move_dirs('diag')
  end
end

class Bishop < Piece
  include Slide

  def initialize(player)
    @player = player
    @symbol = isWhite?? '♗ ' : '♝ '
    move_dirs('diag')
  end
end