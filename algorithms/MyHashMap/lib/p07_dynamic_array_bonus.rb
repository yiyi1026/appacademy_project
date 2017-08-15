class StaticArray
  def initialize(capacity)
    @store = Array.new(capacity)
  end

  def [](i)
    validate!(i)
    @store[i]
  end

  def []=(i, val)
    validate!(i)
    @store[i] = val
  end

  def length
    @store.length
  end

  private

  def validate!(i)
    raise "Overflow error" unless i.between?(0, @store.length - 1)
  end
end

class DynamicArray
  include Enumerable

  attr_reader :count

  def initialize(capacity = 8)
    @store = StaticArray.new(capacity)
    @count = 0
  end

  def [](i)
    return nil if i < -@count || i >= @count
    i += @count until i >= 0
    check_index(i)
    @store[i]
  end

  def []=(i, val)
    if i >= @count
      (i - @count + 1).times {|_| push(nil) }
    elsif i > -@count
      i += @count until i >= 0
    end
    @store[i] = val
  end

  def capacity
    @store.length
  end

  def include?(val)
    each {|el| return true if val == el}
    false
  end

  def push(val)
    resize! if @count == capacity
    @store[@count] = val
    @count += 1
    # p self
    self
  end

  def unshift(val)
    resize! if @count == capacity
    new_store = StaticArray.new(capacity+1)
    new_store[0] = val
    for i in (0...capacity)
      new_store[i + 1] = self[i]
    end
    @count += 1
    @store = new_store
    self
  end

  def pop
    last_el = last
    @count -= 1
    last_el
  end

  def shift
    return nil if @count == 0
    first_el = self.first
    new_store = StaticArray.new(capacity)
    for i in (1...capacity)
      new_store[i-1] = self[i]
    end
    @store = new_store
    @count -= 1
    first_el
  end

  def first
    self[0]
  end

  def last
    self[@count - 1]
  end

  def each
    for i in (0...capacity)
      yield self[i]
    end
    self
  end

  def to_s
    "[" + inject([]) { |acc, el| acc << el }.join(", ") + "]"
  end

  def ==(other)
    return false unless [Array, DynamicArray].include?(other.class)
    return false unless @count == other.length 
    for i in (0...count) 
      return false unless self[i] == other[i]
    end
    true
  end

  alias_method :<<, :push
  [:length, :size].each { |method| alias_method method, :count }

  private

  def resize!
    new_store = StaticArray.new(2 * capacity)
    for i in (0...capacity)
      new_store[i] = self[i]
    end
    # each_with_index {|el, idx| new_store[idx] = el}
    @store = new_store
  end

  def check_index(index)
    return nil unless index.between?(-@count, @count - 1)
  end
end
