class PolyTreeNode
  attr_reader :parent, :children, :value

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(value)
    @parent.children.delete(self) if parent
    @parent = value
    @parent.children << self if parent
  end

  def add_child(child_node)
    child_node.parent = self
    @children << child_node unless @children.include?(child_node)
  end

  def remove_child(child_node)
    raise unless @children.include?(child_node)
    child_node.parent = nil
    @children.delete(child_node)
  end

  def dfs(target)
    return self if value == target
    children.each do |child|
      result = child.dfs(target)
      return result if result
    end
    nil
  end

  def bfs(target)
    queue = [self]
    until queue.empty?
      node = queue.shift
      return node if node.value == target
      queue.concat(node.children)
    end
    nil
  end
end
