require 'binary_search_tree'

def kth_largest(tree_node, k)
  val = BinarySearchTree.new.in_order_traversal(tree_node)[-k]
  BinarySearchTree.new.find(val,tree_node)
end
