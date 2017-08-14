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
  attr_reader :count

  def initialize(capacity = 8)
    @store = StaticArray.new(capacity)
    @count = 0
  end

  def [](i)
    validate!(i)
    @store[i]
  end

  def []=(i, val)
    validate!(i)
    @store[i] = val
  end

  def capacity
    @store.length
  end

  def include?(val)
    for i in (0...capacity)
      return true if val === @store[i]
    end
    false
  end

  def push(val)
    # if @count = capacity
    #   resize!
    # end
    @store[@count] = val
    @count += 1
  end

  def unshift(val)
    original_store = @store
    if @count == capacity
      resize!
    end
    new_store = StaticArray.new(capacity)
    new_store[0] = val
    for idx in (0...original_store.length)
      new_store[idx + 1] = original_store[idx]
    end
    @count += 1
    @store = new_store
  end

  def pop
    p "@count" + "#{@count}"
    # p "@store" 
    # p @store
    return nil if @count == 0
    el = self[@count-1].dup
    p el
    self[@count-1] = nil
    @count -= 1
    el
  end

  def shift
    el = self.first
    new_store = StaticArray.new(capacity-1)
    for i in (0...capacity-1)
      new_store[i] = self[i+1]
    end
    @count -= 1
    @store = new_store
    el
  end

  def first
    self[0]
  end

  def last
    self[@count-1]
  end

  def each
  end

  def to_s
    "[" + inject([]) { |acc, el| acc << el }.join(", ") + "]"
  end

  def ==(other)
    return false unless [Array, DynamicArray].include?(other.class)
    # return false unless self.capacity == other.capacity
  end

  alias_method :<<, :push
  [:length, :size].each { |method| alias_method method, :count }

  private

  def resize!
    @count = capacity
    original_store = @store
    new_store = StaticArray.new(2*capacity)
    for idx in (0...original_store.length)
      new_store[idx] = original_store[idx]
    end
    @store = new_store
  end

  def validate!(i)
    raise "Overflow error" unless i.between?(0, @store.length - 1)
  end
end
