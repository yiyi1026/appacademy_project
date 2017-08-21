# There are many ways to implement these methods, feel free to add arguments 
# to methods as you see fit, or to create helper methods.
require 'bst_node'
class BinarySearchTree
  attr_accessor :root
  def initialize(root_val = nil)
    # @root = nil
    @root = BSTNode.new(root_val) if root_val
  end

  def insert(value, root = @root)
    # root is for position
    if root.nil?
      # if root is nil, set root to a new bstnode with @value = value
      @root = BSTNode.new(value)
      value
      return
    end
    
    case value <=> root.value
    when -1
      if root.left
        insert(value, root.left)
      else
        root.left = BSTNode.new(value, root)
      end
    when 1
      if root.right
        insert(value, root.right)
      else
        root.right = BSTNode.new(value, root)
      end
    end

    root = BSTNode.new(value)
  end

  def find(value, tree_node = @root)
    return nil if tree_node.nil?
    case tree_node.value <=> value
    when 1
      find(value, tree_node.left)
    when -1
      find(value, tree_node.right)
    when 0
      return tree_node
    end
  end

  def delete(value)
    node = find(value)
    if node.has_no_children?
      erase(node)
    elsif node.has_two_children?
      left_child = node.left
      right_child = node.right
      left_max_node = maximum(left_child)
      delete(left_max_node.value)
      connect(node.parent, left_max_node)
      left_max_node.left = left_child
      left_max_node.right = right_child
    elsif node.left
      left_child = node.left
      connect(node.parent, left_child)
    else node.right
      right_child = node.right
      connect(node.parent, right_child)
    end
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    return tree_node if tree_node.has_no_children? || tree_node.right.nil?
    maximum(tree_node.right)
  end

  def depth(tree_node = @root)
    return 0 if tree_node.nil?
    return 0 if tree_node.has_no_children?
    return 1 + [depth(tree_node.left), depth(tree_node.right)].max
  end 

  def is_balanced?(tree_node = @root)
    return true if tree_node.nil? || tree_node.has_no_children?
    if tree_node.has_two_children?
      return false unless (depth(tree_node.left) - depth(tree_node.right)).abs <= 1
      return false unless is_balanced?(tree_node.left) && is_balanced?(tree_node.right)
    elsif tree_node.left
      return false unless depth(tree_node.left) <= 1
    elsif tree_node.right
      return false unless depth(tree_node.right) <= 1
    end
    true
  end

  def in_order_traversal(tree_node = @root, arr = [])
    return arr unless tree_node
    if tree_node.left
      arr =  in_order_traversal(tree_node.left, arr)
    end
    arr.push(tree_node.value)
    if tree_node.right
      arr =  in_order_traversal(tree_node.right, arr)
    end
    arr
  end


  private
  # optional helper methods go here:
  def erase(node)
    # delete no_children_node 
    if node.parent
      node.is_left_child? ? node.parent.left = nil : node.parent.right = nil
    else
      @root = nil
    end
  end

  def connect(parent, child)
    case parent <=> child
    when 1
      parent.left = child
      child.parent = parent
    when -1
      parent.right = child
      child.parent = parent
    end
  end
end
