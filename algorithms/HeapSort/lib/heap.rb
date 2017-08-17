class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @prc = prc || Proc.new{|i,j| i <=> j}
    @store = []
  end

  def count
    @store.length
  end

  def extract
    #swap the last one with the first one
    # remove the last one (the previous first one)
    # order
    val = @store[0]
    
    if count > 1
      #swap
      @store[0] = @store.pop
      self.class.heapify_down(@store, 0, &prc)
    else
      @store.pop
    end
    
    val
  end

  def peek
    @store[0]
  end

  def push(val)
    @store.push(val)
    self.class.heapify_up(store, self.count - 1, count, &prc)
  end

  public
  def self.child_indices(len, parent_index)
    [parent_index * 2 + 1, parent_index * 2 + 2].select{|i| i < len}
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index == 0
    (child_index - 1)/2
  end

  def self.heapify_down(array, parent_index, len = array.length, &prc)
    prc ||= Proc.new{|i,j| i <=> j}

    parent_value = array[parent_index]
    return array if self.child_indices(len, parent_index).empty?
    l_child_index, r_child_index = self.child_indices(len, parent_index)
    children = [array[l_child_index]]
    children << array[r_child_index] if r_child_index
    if children.all?{|child|prc.call(parent_value, child) <= 0 }
      @store = array
    elsif children.last == children.first || prc.call(children[0], children[1]) < 0
      array[l_child_index], array[parent_index] = array[parent_index], array[l_child_index]
      return self.heapify_down(array, l_child_index, len, &prc)
    else
      array[r_child_index], array[parent_index] = array[parent_index], array[r_child_index]
      return self.heapify_down(array, r_child_index, len, &prc)
    end
    # @store = array
  end

  def self.heapify_up(array, child_index, len = array.length, &prc)
    prc = prc || Proc.new{|i,j| i <=> j}
    return array if child_index == 0

    parent_idx = self.parent_index(child_index)
    if prc.call(array[parent_idx],array[child_index]) == 1
      array[parent_idx],array[child_index] = array[child_index], array[parent_idx]
      return heapify_up(array, parent_idx, len, &prc)
    end
    array
  end
end
