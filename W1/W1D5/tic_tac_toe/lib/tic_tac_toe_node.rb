require_relative 'tic_tac_toe'
require 'byebug'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    return true if board.over? && board.winner != evaluator

    if next_mover_mark == evaluator
      # Opponent's turn
      children.all? { |child| child.losing_node?(evaluator) }
    else
      # Evaluator's turn
      children.any? { |child| child.losing_node?(evaluator) }
    end
  end

  def winning_node?(evaluator)
    return true if board.over? && board.winner == evaluator

    if next_mover_mark == evaluator
      # Opponent's turn
      children.all? { |child| child.winning_node?(evaluator) }
    else
      # Evaluator's turn
      children.any? { |child| child.winning_node?(evaluator) }
    end
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    moves = []

    @board.rows.each_with_index do |row, i|
      row.each_with_index do |col, j|
        next if col
        pos = [i, j]

        next_board = @board.dup
        next_board[pos] = @next_mover_mark
        next_mark = @next_mover_mark == :x ? :o : :x
        moves << TicTacToeNode.new(next_board, next_mark, pos)
      end
    end
    moves
  end

end
