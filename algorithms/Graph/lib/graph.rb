class Vertex
  attr_accessor :value, :in_edges, :out_edges
  def initialize(value)
    @value = value
    @in_edges = []
    @out_edges = []
  end

end

class Edge
  attr_accessor :from_vertex, :to_vertex
  attr_reader :cost
  def initialize(from_vertex, to_vertex, cost = 1)
    @cost = cost
    @from_vertex = from_vertex
    @to_vertex = to_vertex
    from_vertex.out_edges << self
    to_vertex.in_edges << self

  end

  def destroy!

    @from_vertex.out_edges.delete(self)
    @to_vertex.in_edges.delete(self)
    @from_vertex = nil
    @to_vertex = nil
    self

  end

  def ==(other_edge)
    @cost == other_edge.cost && @from_vertex == other_edge.from_vertex && @to_vertex == other_edge.to_vertex
  end
end
