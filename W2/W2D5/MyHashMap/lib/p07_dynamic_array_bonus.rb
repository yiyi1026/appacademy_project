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
    return nil unless (-count...count).cover?(i)
    i += count until i >= 0
    @store[i]
  end

  def []=(i, val)
    if i > count
      (i + 1 - count).times do
        push(nil)
      end
    elsif i >= -count
      i += count until i >= 0
    else
      return nil
    end
    @store[i] = val

  end

  def capacity
    @store.length
  end

  def include?(val)
    each do |el|
      return true if val == el
      resize! if count > capacity
    end
    false
  end

  def push(val)
    resize! until capacity > count
    self[count] = val
    @count += 1
  end

  def unshift(val)
    resize! if count >= capacity
    new_store = StaticArray.new(capacity)
    new_store[0] = val
    count.times do |i|
      new_store[i + 1] = self[i]
    end
    @store = new_store
    @count += 1

    val
  end

  def pop
    if @count > 0
      val = self[count-1]
      @count -= 1
      val
    end
  end

  def shift
    val = self[0]
    (@count-1).times do |i|
      self[i] = self[i + 1]
    end
    pop
    val
  end

  def first
    self[0]
  end

  def last
    self[count-1]
  end

  def each(&prc)
    count.times do |i|
      prc.call(self[i])
    end
  end

  def to_s
    "[" + inject([]) { |acc, el| acc << el }.join(", ") + "]"
  end

  def ==(other)
    return false unless [Array, DynamicArray].include?(other.class)
    return false unless count == other.count
    count.times do |i|
      return false unless self[i] == other[i]
    end

    true
  end

  alias_method :<<, :push
  [:length, :size].each { |method| alias_method method, :count }

  private

  def resize!
    store = StaticArray.new(2 * capacity)
    count.times do |i|
      store[i] = self[i]
    end
    @store = store
  end
end
