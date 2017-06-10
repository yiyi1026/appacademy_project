require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def include?(key)
    self[key].include?(key)
  end

  def insert(key)
    return false if include?(key)
    resize! if @count >= num_buckets
    self[key] << key
    @count += 1
    key
  end

  def remove(key)
    self[key].delete(key)
  end

  private

  def [](num)
    index = num.hash % num_buckets
    @store[index]
  end

  def num_buckets
    @store.length
  end

  def resize!
    @count = 0
    temp_array = @store.flatten
    @store = Array.new(num_buckets * 2) { Array.new }
    temp_array.each do |el|
      insert(el)
    end
  end
end
