class MaxIntSet
  attr_accessor :store
  def initialize(max)
    @store = Array.new(max,false)
  end

  def insert(num)
    raise "Out of bounds" if num >= @store.length || num < 0
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  attr_accessor :store
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    index = insertion_index(num)
    @store[index] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    index = insertion_index(num)
    @store[index]
  end

  def insertion_index(num)
    num % @store.length
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    unless include?(num)
      if @count == @store.length
        send(:resize!)
      end
      index = insertion_index(num)
      @store[index] << num
      @count += 1
    end
  end

  def remove(num)
    x = self[num].delete(num)
    @count -= 1 if x
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def insertion_index(num)
    num % @store.length
  end

  def [](num)
    index = insertion_index(num)
    @store[index]
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

  def num_buckets
    @store.length
  end


end
