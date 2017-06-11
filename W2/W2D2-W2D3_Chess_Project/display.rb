require "colorize"
require_relative "board"
require_relative "cursor"

class Display
  attr_accessor :board, :cursor, :cursor_pos
  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board
  end

  def render
    system("clear")
    board.board.each_with_index do |row, row_index|
      row.each_with_index do |square, col_index|
        color([row_index, col_index], @cursor.cursor_pos, @board[[row_index, col_index]])
      end
      print "\n"
    end
    print "\n"
  end

  def play_turn
    self.render
    until won?
      cursor.get_input

      # p @board[[0,0]]
      # @board.move_piece([0,0], [3,0])

      render

    end
  end

  def won?
    false
  end

  def color(pos, cursor_pos, piece)
  # case pos <=> cursor_pos
  #   when -1
  #     puts " White ".colorize(:color => :black, :background => :white)
  #   when 0 #(pos[0] + pos[1]).even?
  #     puts " Cursor ".colorize(:color => :blue, :background => :red)
  #   when 1 #(pos[0] + pos[1]).odd?
  #     puts " Black ".colorize(:color => :white, :background => :black)
  #   end
    if (pos == cursor_pos)
      print piece.symbol.colorize(:color => :blue, :background => :red)
    elsif (pos[0] + pos[1]).even?
      print piece.symbol.colorize(:color => :black, :background => :light_black)
    elsif (pos[0] + pos[1]).odd?
      print piece.symbol.colorize(:color => :black, :background => :white)
    end
  end
end

# p String.colors
#
board = Board.new
display = Display.new(board)

display.play_turn
