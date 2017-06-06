require_relative 'tic_tac_toe_node'
require_relative 'tic_tac_toe'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    node = TicTacToeNode.new(game.board, mark)
    winning_moves = node.children.select do |child|
      child.winning_node?(mark)
    end

    if winning_moves.empty?
      neutral_moves = node.children.select do |child|
        !child.losing_node?(mark)
      end
      nm = neutral_moves.map{|move|move.prev_move_pos}
      p "Neutral: #{nm}"
      return neutral_moves[0].prev_move_pos
    else
      wm = winning_moves.map{|move|move.prev_move_pos}
      p "Wins: #{wm}"
      return winning_moves[0].prev_move_pos
    end
    raise 'what'
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
