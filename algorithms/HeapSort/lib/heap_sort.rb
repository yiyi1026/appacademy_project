require_relative "heap"

class Array
  def heap_sort!
    #heapify is method to return the smallest element
    #extract swap the first element with the last element, 
    #then pop the last element(the smallest element of array) to the result array(sorted)
    2.upto(count).each do |size|
      BinaryMinHeap.heapify_up(self, size - 1, size)
    end

    count.downto(2).each do |size|
      self[0], self[size - 1] = self[size - 1], self[0]
      BinaryMinHeap.heapify_down(self, 0, size - 1)
    end

    reverse!
  end
end
