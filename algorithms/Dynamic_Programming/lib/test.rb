def frog_cache_builder(n)
  hash = {}
  hash[1] = [[1]]
  hash[2] = [[1, 1], [2]]
  hash[3] = [[1, 1, 1], [2, 1], [1, 2], [3]]

  (4..n).each do |i|
    hash[i] = hash[i-1].map{|way|way + [1]}
    hash[i] += hash[i-2].map{|way|way + [2]}
    hash[i] += hash[i-3].map{|way| way + [3]}
  end

  return hash
end

def frog_hops_top_down(n)
  # return hash[n] if hash[n]
  f(n)
end
$cache = {}
$count = 0
def f(n)
  $count += 1
  return $cache[n] if $cache[n]
  $cache[n] = [[]] if n <= 0
  $cache[1] = [[1]] unless $cache[1]
  $cache[2] = [[1, 1], [2]] unless $cache[2]
  $cache[3] = [[1, 1, 1], [2, 1], [1, 2], [3]] unless $cache[3]
  # return $cache[n] if n < 4
  (4..n).each do |i|
    $cache[i] = f(i-1).map{|way|way + [1]} + f(i-2).map{|way|way + [2]} + f(i-3).map{|way| way + [3]}
  end
  $cache[n]
end

p [[1]] * 6
