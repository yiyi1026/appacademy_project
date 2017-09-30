class UnionFind
  # quick-find algorithms take O(n) to initialize and O(n) to union
  # Together it's O(n2)


  attr_reader :store
  def initialize(n)
    @store = (0..n).map{|val|Node.new(val)}
  end

  def union(p, q)
    # add connection between p and q
    # merge components containing p and g, change all entries
    # whose id equals id[p] to id[q]
    # change first one to match the second one

    old_id = p.id
    new_id = q.id
    @store.each do |node|
      node.id = new_id if node.val == old_id
    end

  end

  def connected?(p, q)
    # if p and q are in the same component
    p.id == q.id
  end

  def find(p)
    # time complexity O(1)    
    p.id
  end

  def count

  end

end

class Node
  attr_accessor :id
  def initialize(val)
    @val = val
    @id = val
  end

end