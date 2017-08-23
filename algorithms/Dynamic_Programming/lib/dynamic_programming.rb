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
    # if n >= 4
    #   4.times do
    # return @cache[n] if @cache[n]
    # return frog_hops_top_down_helper(n) if n < 4
    #   end
    # end
    frog_hops_top_down_helper(n)
    # @cache[n] = frog_hops_top_down_helper(n)
    # @cache[n]
    # # (4..n).each do |i|
    # # return @cache[n] if n < 4
    # @cache[n] = frog_hops_top_down_helper(n-1).map{|way|way + [1]} +frog_hops_top_down_helper(n-2).map{|way|way + [2]} + frog_hops_top_down_helper(n-3).map{|way| way + [3]} if n > 3
    # # end
    # @cache[n]

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

  end

  def knapsack(weights, values, capacity)

  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)

  end

  def maze_solver(maze, start_pos, end_pos)
    # bonus problem
  end

  def self.combine(route1, route2)
    p route1
    p route2
    result = []
    route1.each do |path1|
      route2.each do |path2|
        result << path1 + path2
      end
    end
    result
  end
end


