class Link
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
    prev.next = self.next if prev
    self.next.prev = prev if self.next
    self.next = nil
    self.prev = nil
    self
  end
end

class LinkedList

  include Enumerable
  def initialize
    @head = Link.new
    @tail = Link.new
    @head.next = @tail
    @tail.prev = @head

  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    empty? ? nil : @head.next
  end

  def last
    empty? ? nil : @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    each do |current_link|
      return current_link.val if current_link.key == key
    end
  end

  def include?(key)
    each do |current_link|
      return true if current_link.key == key
    end
    false
  end

  def append(key, val)
    new_link = Link.new(key, val)

    @tail.prev.next = new_link
    new_link.prev = @tail.prev
    new_link.next = @tail
    @tail.prev = new_link

    new_link
  end

  def update(key, val)
    each do |current_link|
      if current_link.key == key
        current_link.val = val
        return current_link
      end
    end
  end

  def remove(key)
    each do |current_link|
      if current_link.key == key
        current_link.remove
        return current_link.val
      end
    end

    nil
  end

  def each(&prc)
    current_link = @head.next
    until current_link == @tail
      prc.call(current_link) if block_given?
      current_link = current_link.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
