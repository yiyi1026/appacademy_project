require_relative 'card'
require_relative 'board'
require_relative 'computer_player'
require 'byebug'
class Game
  attr_accessor :board, :previous_guess, :player

  def initialize(player)
    @player = player
    @previous_guess = nil
    @board = Board.new
  end

  def play
    byebug
    i = 0
    pos = [nil, nil]
    until board.won?
      render
      pos = make_valid_guess
      board.reveal(pos)
      player.receive_revealed_card(pos, board[pos].face_value)
      @previous_guess = pos
      render

      pos = make_valid_guess
      until pos != previous_guess
        pos = make_valid_guess
        i += 1
      end
      raise "Too many trials" if i == 50
      board.reveal(pos)
      player.receive_revealed_card(pos, board[pos].face_value)


      if board[previous_guess].face_value == board[pos].face_value
        player.receive_match(pos,previous_guess)
      else
        render
        sleep(2)
        system("clear")
        board[previous_guess].hide
        board[pos].hide
      end
      @previous_guess = nil

    end
    congratulate
  end

  def render
    board.render
  end

  def make_valid_guess
    pos = [nil, nil]
    until valid_guess?(pos)
      player.prompt
      pos = player.get_input(@previous_guess)
    end
    puts "position in valid_guess #{pos}"
    pos
  end
  # def make_guess
  #   gets.chomp.split(",").map(&:to_i)
  # end

  # def prompt
  #   puts "Please guess a position."
  # end

  def valid_guess?(pos)
    row, col = pos
    return false unless row.is_a?(Integer) && row >= 0 && row < board.grid.length
    return false unless col.is_a?(Integer) && col >= 0 && col < board.grid.length
    return false if board.grid[row][col].face_up
    true
  end

  private

  def congratulate
    puts "congratulations! You win!!"
  end

end

game = Game.new(ComputerPlayer.new("jacks"))
game.board.populate
game.play
