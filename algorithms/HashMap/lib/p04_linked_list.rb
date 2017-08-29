class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous node to next node
    # and removes self from list.
    @prev.next = @next if @prev
    @next.prev = @prev if @next
    # @next = nil
    # @prev = nil
    # self
  end
end

class LinkedList
  include Enumerable
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
    
  end

  def [](i)
    each_with_index { |node, j| return node if i == j }
    nil
  end

  def first
    # empty? ? nil : @head.next
    @head.next
  end

  def last
    # empty? ? nil : @tail.prev
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    each do |node|
      return node.val if node.key == key
    end
  end

  def include?(key)
    each do |node|
      return true if node.key == key
    end

    false
  end

  def append(key, val)
    new_node = Node.new(key, val)

    if empty?
      @head.next = new_node
      new_node.prev = @head
      new_node.next = @tail
      @tail.prev = new_node
    else
      old_last = @tail.prev
      old_last.next = new_node
      new_node.prev = old_last
      new_node.next = @tail
      @tail.prev = new_node
    end   

    new_node
  end

  def update(key, val)
    each do |node|
      if node.key == key
        node.val = val
        return node
      end
    end
    
  end

  def remove(key)
    each do |node|
      if node.key == key
        node.remove
        return node.val
      end
    end
  end

  def each(&prc)
    current_node = @head.next
    
    until current_node == @tail
      prc.call(current_node) if block_given?
      current_node = current_node.next
    end

  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  end
end
