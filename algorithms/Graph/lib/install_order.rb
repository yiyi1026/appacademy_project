# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to

require_relative 'topological_sort'

def install_order(arr)
  max = arr.sort_by{|t|t[0]}[-1][0]

  hash = {}
  (1..max).each do |id|
    hash[id] = Vertex.new(id)
  end
  vertices = hash.values
  arr.each do | tup|
    id = tup[0]
    dep_id = tup[1]
    Edge.new(hash[dep_id], hash[id])

  end
  topological_sort(vertices).map{|vertex|vertex.value}
  
end
