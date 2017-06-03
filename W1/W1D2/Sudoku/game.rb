require_relative "board.rb"
require_relative "tile.rb"


class Game
  attr_reader :board

  def initialize(board)
    @board = board
  end

  def play
    until board.solved?
      board.render
      given = true
      value = nil
      until given == false && value.is_a?(Integer) && value < 10 && value > 0
        prompt
        row, col, value = gets.chomp.split(",").map(&:to_i)
        given = board[[row, col]].given
        puts given
        puts board[[row, col]].value
      end
      board[[row, col]] = value
    end
    congratulate
  end

  def prompt
    puts "Please enter a position and a value"
  end

  def congratulate
    puts "congratulations, you win!!"
  end

end

board = Board.new
game = Game.new(board)
game.play
