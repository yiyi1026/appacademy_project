class LRUCache
  def initialize(max = 8)
    @max = max
    @store = []
  end

  def count
    # returns number of elements currently in cache
    @store.length
  end

  def add(el)
    # adds element to cache according to LRU principle
    if include?(el)
      update!(el)
    else
      eject! if count >= @max
    end
    @store.push(el)

  end

  def show
    # shows the items in the cache, with the LRU item first
    p @store
  end

  private
  # helper methods go here!
  def eject!
    @store.shift
  end

  def update!(val)
    @store.delete(val)
    @store.push(val)
  end

  def include?(val)
    @store.include?(val)
  end

end