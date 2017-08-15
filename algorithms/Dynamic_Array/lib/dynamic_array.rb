require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    @store = StaticArray.new(8)
    @length = 0
    @capacity = 8
    # @start_idx = 0
  end

  # O(1)
  def [](index)
    check_index(index)
    @store[index% capacity]
  end

  # O(1)
  def []=(index, value)
    check_index(index)
    @store[index % capacity] = value
  end

  # O(1)
  def pop
    check_index(0)
    last_el = self[@length-1]
    @length -= 1
    last_el
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    resize! if length == capacity
    @store[length % capacity] = val
    @length += 1
    self
  end

  # O(n): has to shift over all the elements.
  def shift
    check_index(0)
    first_el = self[0]
    (@length-1).times do |i|
      self[i] = self[i + 1]
    end
    @length -= 1
    # @start_idx = (@start_idx + 1)% capacity
    first_el
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    resize! if length >= capacity
    new_store = StaticArray.new(capacity)
    new_store[0] = val
    length.times do |i|
      new_store[i + 1] = self[i]
    end
    @store = new_store
    @length += 1

    val
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
    raise "index out of bounds" unless index.between?(0, length-1)
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    new_store = StaticArray.new(capacity * 2)
    for i in (0...capacity)
      new_store[i] = self[i]
    end
    @capacity *= 2
    @store = new_store
    @start_idx = 0
  end
end
