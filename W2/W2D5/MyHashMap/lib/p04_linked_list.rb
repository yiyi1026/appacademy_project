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
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  attr_accessor :head, :tail
  include Enumerable
  def initialize
    @head = nil
    @tail = nil

  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head
  end

  def last
    @tail
  end

  def empty?
    @head.nil? && @tail.nil?
  end

  def get(key)
    self.each do |current_link|
      if current_link.key == key
        return current_link.val
      end
    end
  end

  def include?(key)
    self.each do |current_link|
      if current_link.key == key
        return true
      end
    end
    false
  end

  def append(key, val)
    if empty?
      @head = Link.new(key, val)
      @tail = @head
    else
      new_link = Link.new(key, val)
      new_link.prev = @tail
      @tail.next = new_link
      @tail = new_link
    end
  end

  def update(key, val)
    each do |current_link|
      if current_link.key == key
        current_link.val = val
        return
      end
    end
  end

  def remove(key)
    if @head.key == key
      @head = @head.next
    elsif @tail.key == @tail
      @tail = @tail.prev
      @tail.next = nil
    else
      each do |current_link|
        if current_link.key == key
          previous_link = current_link.prev
          next_link = current_link.next
          previous_link.next = next_link if previous_link
          next_link.prev = previous_link if next_link
        end
      end
    end
  end

  def each(&prc)
    current_link = @head
    until current_link.nil?
      prc.call(current_link) if block_given?
      current_link = current_link.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
