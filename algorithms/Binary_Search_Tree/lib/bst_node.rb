class BSTNode
  attr_accessor :value, :parent, :left, :right
  def initialize(value, parent = nil, left = nil, right = nil)
    @value = value
    @parent = parent
    @left = left
    @right = right
  end

  def <=>(other_node)
    @value <=> other_node.value
  end

  def nil?
    @value.nil?
  end

  def has_no_children?
    @left.nil? && @right.nil?
  end

  def is_left_child?
    @parent.left == self if @parent
  end

  def is_right_child?
    @parent.right == self if @parent
  end

  def has_two_children?
    @left && @right
  end

end
