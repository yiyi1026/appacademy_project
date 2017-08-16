require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    return false if include?(key)
    resize! unless num_buckets > @count   
    @count += 1
    self[key.hash] << key

    key

  end

  def include?(key)
    self[key.hash].include?(key)
  end

  def remove(key)
    self[key.hash].delete(key)
    @count -= 1
    key.hash
  end

  private

  def [](num)
    # only the index is hashed, the key value is inserted
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store
    @store = Array.new(2 * num_buckets) { Array.new }
    old_store.flatten.each{|el|insert(el)}
  end
end
