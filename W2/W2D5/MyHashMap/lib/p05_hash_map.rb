require_relative 'p02_hashing'
require_relative 'p04_linked_list'
require "byebug"

class HashMap
  include Enumerable
  attr_reader :count
  attr_accessor :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    bucket(key).include?(key)
  end

  def set(key, val)
    if include?(key)
      bucket(key).update(key, val)
    else
      if @count == @store.length
        resize!
      end
      bucket(key).append(key, val)
      @count += 1
    end
  end

  def get(key)
    bucket(key).get(key)
  end

  def delete(key)
    if include?(key)
      bucket(key).remove(key)
      @count -= 1
    end
  end

  def each(&prc)
    @store.each do |link|
      link.each do |el|
        prc.call(el.key, el.val)
      end
    end
  end

  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
    index = insertion_index(key)
    @store[index]
  end
end

  def insertion_index(key)
    key.hash % @store.length
  end

  def num_buckets
    @store.length
  end

  def resize!
    temp_array = []
    @store.each do |link_list|
      link_list.each{|link| temp_array << [link.key, link.val]}
    end

    @store = Array.new(@store.length * 2) { LinkedList.new }
    @count = 0
    temp_array.each do |k, v|
      self.set(k, v)
    end
  end
