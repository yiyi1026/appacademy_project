require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  length = vertices.length
  sorted = []
  top = Queue.new
  vertices.each do |vertex|
    top.enq(vertex) if vertex.in_edges.empty?    
  end

  until top.empty?
    current = top.pop
    sorted << current 

    until current.out_edges.empty?
      edge = current.out_edges.pop
      top.push(edge.to_vertex) if edge.to_vertex.in_edges.length == 1
      edge.destroy!
    end

    current.in_edges.each do |edge|
      edge.destroy!
    end

  end

  sorted.length == length ? sorted : []
end
