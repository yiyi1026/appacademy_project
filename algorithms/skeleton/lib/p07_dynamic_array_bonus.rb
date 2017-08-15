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
    @start_idx = 0
  end

  def [](i)
    if i >= @count
      return nil
    elsif i < 0
      return nil if i < -(@count)
      return self[@count + i]
    end
    # if i.abs >= @count
    #   return nil
    # elsif i < 0
    #   return self[@count + i]
    # end
    @store[(@start_idx + i) % capacity]
  end

  def []=(i, val)
    if i >= @count
      (i - @count).times { push(nil) }
    elsif i < 0
      return nil if i < -(@count)
      return self[@count + i] = val
    end

    if i == @count
      resize! if capacity == @count
      @count += 1
    end

    @store[(@start_idx + i) % capacity] = val
  end

  def capacity
    @store.length
  end

  def include?(val)
    for i in (0...capacity)
      return true if val == @store[i]
    end
    false
  end

  def push(val)
    resize! if @count = capacity 
    @store[(@start_idx + @count) % capacity] = val
    @count += 1
    # p @store[0]
    # p @count
    self
  end

  def unshift(val)
    resize! if @count == capacity
    @start_idx = (@start_idx -1) % capacity
    @store[@start_idx] = val
    @count += 1
    self
  end

  def pop
    return nil if @count == 0
    last_el = @store[(@start_idx+ @count-1) % capacity]
    @count -= 1
    last_el
  end

  def shift
    return nil if @count == 0
    @count -= 1
    first_el = self.first
    @start_idx = (@start_idx + 1) % capacity
    first_el
  end

  def first
    return nil if @count == 0
    @store[@start_idx]
  end

  def last
    return nil if @count == 0
    @store[(@start_idx + @count-1) % capacity]
  end

  def each(&prc)
    @count.times { |i| yield self[i] }
    
    # @count.times do |i|
    #   prc.call(self[i])
    # end
    self
  end

  def to_s
    "[" + inject([]) { |acc, el| acc << el }.join(", ") + "]"
  end

  def ==(other)
    return false unless [Array, DynamicArray].include?(other.class)
    return false unless self.length == other.length
    for i in (0...capacity)
      return false unless self[i] == other[i]
    end
    true
  end

  alias_method :<<, :push
  [:length, :size].each { |method| alias_method method, :count }

  private

  def resize!
    new_store = StaticArray.new(2*capacity)
    each_with_index { |el, i| new_store[i] = el }
    # for idx in (0...capacity)
    #   new_store[idx] = @store[idx]
    # end
    @store = new_store
    @start_idx = 0
  end

  # def validate!(i)
  #   raise "Overflow error" unless i.between?(0, @store.length - 1)
  # end
end
