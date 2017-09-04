class Node
  attr_reader :val
  def initialize(val = nil)
    @val = val
    @next = nil

end

class SinglyLinkedList
  def initialize
    @head = Node.new
    @head.next = nil
  end

  def append(val)
    current_node = last
    current_node.next = Node.new(val)
  end

  def last
    current_node = @head.next
    return @head if current_node == nil
    until current_node.next == nil
      current_node = current_node.next
    end

    current_node
  end

  def get(val)
    current_node = @head.next
    return @head if current_node.val == nil
    until current_node.val == nil
      return nil if current_node == nil
      current_node = current_node.next
    end

    current_node
  end

  def insert(val)

  end

  def update!(val)
    node = get(val)

  def empty?
    @head.next == nil
  end
end