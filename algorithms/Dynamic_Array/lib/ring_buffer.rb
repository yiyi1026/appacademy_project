require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    @store = StaticArray.new(8)
    @start_idx = 0
    @length = 0
    @capacity = 8
  end

  # O(1)
  def [](index)
    check_index(index)
    @store[(@start_idx + index) % capacity]
  end

  # O(1)
  def []=(index, val)
    # check_index(index)
    @store[(@start_idx + index) % capacity] = val
  end

  # O(1)
  def pop
    check_index(0)
    last_el = @store[(@start_idx + @length-1) % capacity]
    @length -= 1
    last_el
  end

  # O(1) ammortized
  def push(val)
    resize! if length == capacity
    @store[(@start_idx + @length) % capacity] = val
    @length += 1

    self
  end

  # O(1)
  def shift
    check_index(0)
    first_el = @store[@start_idx]
    @start_idx = (@start_idx + 1)% capacity
    @length -= 1
    first_el
  end

  # O(1) ammortized
  def unshift(val)
    resize! if length == capacity
    @start_idx = (@start_idx - 1) % capacity
    @store[@start_idx] = val
    @length += 1
    self
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
    raise "index out of bounds" unless index.between?(0, length-1)
  end

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
