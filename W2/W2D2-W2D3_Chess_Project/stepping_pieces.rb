require_relative 'piece'

module Step # knight king

  @king_move = false
  @knight_move = false

  # only return true or false
  def move(start_pos, end_pos)
    s_x, s_y = start_pos
    e_x, e_y = end_pos
    # return if move to same pos
    return false if s_x == e_x && s_y == e_y

    if @king_move
      if (s_x - e_x).abs <= 1 && (s_y - e_y).abs <= 1
        return true
      end
    end

    if @knight_move
      if (s_x - e_x).abs * (s_y - e_y).abs == 2
        return true
      end
    end

    false
  end

  def move_dirs(dir)
    case dir
      when 'king'
        @king_move = true
      when 'knight'
        @knight_move = true
    end
  end

end

class Knight < Piece
  include Step

  def initialize(player)
    @player = player
    @symbol = isWhite?? '♘ ': '♞ '
    move_dirs('knight')
  end
end


class King < Piece
  include Step

  def initialize(player)
    @player = player
    @symbol = isWhite?? '♔ ' : '♚ '
    move_dirs('king')
  end
end

