require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    @store = StaticArray.new(0)
    @count = 0
  end

  # O(1)
  def [](index)
    check_index(index)
    @store[index]
  end

  # O(1)
  def []=(index, value)
    @store[index] = value
  end

  # O(1)
  def pop
    check_index(length)
    # new_store = 
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    resize!
    self[@count] = val
    @count += 1
  end

  # O(n): has to shift over all the elements.
  def shift
    check_index(length)
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
  end

  def length
    @count
  end

  def capacity
    @store.length
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
    raise "index out of bounds" unless index.between?(0, length-1)
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    new_store = StaticArray.new(@count * 2)
    count = @count
  end
end
