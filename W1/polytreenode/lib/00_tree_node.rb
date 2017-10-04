class PolyTreeNode
  attr_reader :value, :children, :parent
  # attr_accessor :parent

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(parent_node) 
    return if parent == parent_node  
    old_parent = @parent
    if old_parent
      old_parent.children.delete(self)
    end
    @parent = parent_node
    @parent.children << self unless @parent.nil?
  end

  def add_child(child_node)
    child_node.parent=self
  end

  def remove_child(child_node)
    @children.include?(child_node) ? child_node.parent = nil :  (raise 'no such child')

  end

  def dfs(target)
    if @value == target
      return self
    else
      @children.each do |child|
        result = child.dfs(target)
        return result if result
      end
    end
    nil
  end

  def bfs(target)
    queue = [self]
    until queue.empty?
      first = queue.shift
      if first.value == target
        return first
      else
        queue += first.children
      end
    end
  end

end