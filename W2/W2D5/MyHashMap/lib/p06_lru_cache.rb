require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if @map[key]
      link = @map[key]
      update_link!(link)
    else
      eject! if count >= @max
      calc!(key)
    end


  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private
  attr_reader :map, :store

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
    val = @prc.call(key)
    new_link = @store.append(key, val)
    @map[key] = new_link

    val
  end

  def update_link!(link)
    link.remove
    @store.append(link.key, link.val)
    # suggested helper method; move a link to the end of the list
  end

  def eject!
    deleted_link = @store.first
    deleted_link.remove
    @map.delete(deleted_link.key)
    nil
  end
end
