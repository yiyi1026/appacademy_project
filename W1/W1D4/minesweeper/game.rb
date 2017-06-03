require 'tile'
require 'board'

class Game

  def initialize
    @board = Board.new
  end

  def run
    board.render
    # until over?
    # pos = parse_pos
    # unless valid_pos?(pos)
    #   puts ""
    # action = parse_action
    #
    # end
    until over?
      pos = get_pos
      action = get_action
      case action
      when 'r'
        board.reveal(pos)
      when 'f'

      end
    end
  end

  def valid_pos?(pos)
    i, j = pos
    return false unless (0...board.row).include?(i) &&
                        (0...board.col).include?(j)
    return false if board.revealed?(pos)
    true
    # not finished
  end

  def valid_action?(action)
    ['r', 'f'].include?(action.downcase)
  end

  def parse_pos(input)
    input.split(',').map { |x| Integer(x) }
  end

  def get_pos
    pos = nil
    until pos && valid_pos?(pos)
      puts "Please enter a position on the board (e.g., '3,4')"
      print "> "

      begin
        pos = parse_pos(gets.chomp)
      rescue Exception => ex
        puts "Invalid position entered (did you use a comma?)"
        puts ""

        pos = nil
      end
    end
    pos
  end

  def get_action
    action = nil
    until action && valid_action?(action)
      puts "Please enter an action (r for reveal, f for flag)"
      puts "> "

      begin
        action = gets.chomp
      rescue Exception => ex
        puts "Invalid action entered."
        puts ""

        action = nil
      end
    end
    action
  end

  def over?
  end

  def explode?(pos)
  end

end
