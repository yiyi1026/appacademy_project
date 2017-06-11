# require_relative "board"

class Piece

  attr_reader :symbol, :player

  def initialize (player = nil)
    # @board = board
    @symbol = '  '
    @player = player
  end

  def move

  end

  def isWhite?
    player == :white
  end
end
