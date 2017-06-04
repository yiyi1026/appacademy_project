require_relative 'tile'
require_relative 'board'

class Game
  attr_accessor :board

  def initialize
    @board = Board.new
  end

  def run
    # until over?
    # pos = parse_pos
    # unless valid_pos?(pos)
    #   puts ""
    # action = parse_action
    #
    # end
    until over?
      board.render
      pos = get_pos
      action = get_action
      case action
      when 'r'
        board.reveal(pos)
      when 'f'
        board.flag(pos)
      end
    end
    if board.die?
      p '胜败乃兵家常事，大侠请重新来过。'
    else
      p '你胜利了！给跪了'
    end
  end

  def valid_action?(action)
    ['r', 'f'].include?(action.downcase)
  end

  def parse_pos(input)
    input.split(',').map { |x| Integer(x) }
  end

  def get_pos
    pos = nil
    until pos && board.valid_pos?(pos)
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

    board.die? || board.win?
    
  end

  def explode?(pos)
  end

end


if __FILE__ == $PROGRAM_NAME
  game = Game.new
  game.run
end