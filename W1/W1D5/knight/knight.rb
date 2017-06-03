require_relative 'poly_tree_node'

class KnightPathFinder
  MOVES = [
    [-2, -1],
    [-2, 1],
    [-1, -2],
    [-1, 2],
    [1, -2],
    [1, 2],
    [2, -1],
    [2, 1]
  ]

  def self.valid_moves(pos)
    MOVES.map do |dx, dy|
      [pos[0] + dx, pos[1] + dy]
    end.select do |row, col|
      [row, col].all? do |move|
        move.between?(0, 7)
      end
    end
  end

  def initialize(start_pos)
    @board = Array.new(8) { Array.new(8, nil) }
    @move_tree = PolyTreeNode.new(start_pos)
    @visited_positions = [start_pos]
  end

  def new_move_positions(pos)
    new_moves = self.class.valid_moves(pos).reject do |move|
      @visited_positions.include?(move)
    end
    @visited_positions.concat(new_moves)
    new_moves
  end

  def build_move_tree
    queue = [@move_tree]
    until queue.empty?
      move = queue.shift
      new_move_positions(move.value).each do |new_move|
        node = PolyTreeNode.new(new_move)
        move.add_child(node)
        queue.concat([node])
      end
    end
    @move_tree
  end

  def find_path(end_pos)
    start_node = @move_tree.dfs(end_pos)
    trace_path_back(start_node)
  end

  def trace_path_back(start_node)
    path = []
    node = start_node
    while node.parent
      path << node.value
      node = node.parent
    end
    path << node.value
    path.reverse
  end

end

if __FILE__ == $PROGRAM_NAME
  knight = KnightPathFinder.new([0, 0])
  knight.build_move_tree
  p knight.find_path([7, 6])
  p knight.find_path([6, 2])
end
