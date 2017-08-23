class DynamicProgramming

  def initialize
    @cache = {}
  end

  def blair_nums(n)
    if @cache[n] 
      return @cache[n] 
    end
    if n == 1
      blair_n = 1
    elsif n == 2
      blair_n = 2
    else
      blair_n = blair_nums(n-1) + blair_nums(n-2) + 2 * n - 3
    end
    @cache[n] = blair_n

  end

  def frog_hops_bottom_up(n)
    cache = frog_cache_builder(n)
    cache[n]
  end

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
    frog_hops_top_down_helper(n)

  end

  def frog_hops_top_down_helper(n)
    return @cache[n] if @cache[n]
    @cache[n] = [[]] if n <= 0
    @cache[1] = [[1]] unless @cache[1]
    @cache[2] = [[1, 1], [2]] unless @cache[2]
    @cache[3] = [[1, 1, 1], [2, 1], [1, 2], [3]] unless @cache[3]
    # return @cache[n] if n < 4
    (4..n).each do |i|
      @cache[i] = frog_hops_top_down_helper(i-1).map{|way|way + [1]} + frog_hops_top_down_helper(i-2).map{|way|way + [2]} + frog_hops_top_down_helper(i-3).map{|way| way + [3]}
    end
    @cache[n]
  end

  def super_frog_hops(n, k)

    if n <= 0
      return [[]]
    elsif n == 1
      return [[1]]
    elsif k == 1
      return [[1]*n]
    elsif n < k
      return super_frog_hops(n, n)
    elsif n >= k
      total = []
      (1..k).each do |i|
        total += super_frog_hops(n-i, k).map{|way|way + [i]}
      end
      return total
    end

  end

  def knapsack(weights, values, capacity)
    return 0 if capacity <= 0 || weights.all?{|weight| weight > capacity}

    # use hash to connect weight and value
    hash = Hash.new { |h, k| h[k] = [] }
    weights.each_with_index do |weight, idx|
      hash[weight] << values[idx]
    end
    arr = hash.keys.sort
    return hash[arr[0]].max if arr[0] == capacity




  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)

  end

  def maze_solver(maze, start_pos, end_pos)
    # bonus problem
  end

end


