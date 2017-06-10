require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    unless include?(key)
      if @count == @store.length
        resize!
      end
      index = insertion_index(key)
      @store[index] << key
      @count += 1
    end
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    self[key].delete(key)
  end

  private

  def insertion_index(num)
    num.hash % @store.length
  end

  def [](num)
    index = insertion_index(num)
    @store[index]
  end

  def []=(num, val)
    index = insertion_index(num)
    @store[index] = val
  end

  def num_buckets
    @store.length
  end

  def resize!
    temp_array = []
    @store.each do |subarray|
      until subarray.empty?
        temp_array << subarray.pop
      end
    end

    @store = Array.new(@store.length * 2) { Array.new }
    @count = 0
    temp_array.each do |el|
      self.insert(el)
    end
  end
end
