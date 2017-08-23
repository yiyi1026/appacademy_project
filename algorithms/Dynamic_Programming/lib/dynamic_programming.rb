class DynamicProgramming

  def initialize
    @cache = {}
    @blair_cache = {1 => 1, 2 => 2}
  end

  def blair_nums(n)
    # top down: need to store instance variable
    # Check the cache for a stored answer
    if @blair_cache[n] 
      return @blair_cache[n] 
    end
    # If not found, 1) perform the recursion, 2) store the answer, 3) return the answer. 
    if n == 1
      blair_n = 1
    elsif n == 2
      blair_n = 2
    else
      blair_n = blair_nums(n-1) + blair_nums(n-2) + 2 * n - 3
    end
    @blair_cache[n] = blair_n
    blair_nums(n)
  end

  def frog_hops_bottom_up(n)
    # bottom_up: helper method finishes all the logic. main function only calls the value to that key.
    hash = frog_cache_builder(n)
    hash[n]
  end

  def frog_cache_builder(n)
    # Make a hash or array for storing previous solutions
    hash = {}
    # Add the base cases to the cache  
    hash[n] = [[]] if n < 0
    
    hash[1] = [[1]]
    hash[2] = [[1, 1], [2]]
    hash[3] = [[1, 1, 1], [2, 1], [1, 2], [3]]
    
    # Build solutions 4..n into the cache
    (4..n).each do |i|
      hash[i] = hash[i-1].map{|way|way + [1]} + hash[i-2].map{|way|way + [2]} + hash[i-3].map{|way| way + [3]}
    end
    
    # Return the cache
    hash

  end

  def frog_hops_top_down(n)
    return @cache[n] if @cache[n]
    frog_hops_top_down_helper(n)
  end

  def frog_hops_top_down_helper(n)
    return @cache[n] if @cache[n]
    @cache[n] = [[]] if n <= 0
    @cache[1] = [[1]] unless @cache[1]
    @cache[2] = [[1, 1], [2]] unless @cache[2]
    @cache[3] = [[1, 1, 1], [2, 1], [1, 2], [3]] unless @cache[3]

    (4..n).each do |i|
      @cache[i] = frog_hops_top_down_helper(i-1).map{|way|way + [1]} + frog_hops_top_down_helper(i-2).map{|way|way + [2]} + frog_hops_top_down_helper(i-3).map{|way| way + [3]} unless @cache[i]
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
    # bottom_up: helper method finishes all the logic. main function only calls the value to that key.
    table = knapsack_table(weights, values, capacity)
    table[weights.length][capacity]
  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)
    return 0 if capacity <= 0 || weights.all?{|weight| weight > capacity}
    # use hash to connect weight and value
    
    hash = Hash.new { |h, k| h[k] = [] }
    value_weight_array = []
    weights.each_with_index do |weight, idx|
      # idx, value/weight, value, weight
      value_weight_array << [idx, values[idx]*1.0/weight, values[idx], weight]
    end
    value_weight_array = value_weight_array.sort_by{|el|-el[1]}
    # i for row j for col(weight)
    # value_weight_array.each do ||
    table = Array.new(weights.length+1){Array.new(capacity+ 1)}
    table[0] = [0] * (capacity + 1)
    for i in 1...table.length
      table[i][0] = 0
      for j in 1..capacity
        weight = value_weight_array[i-1][3]
        if weight <= j
          value = value_weight_array[i-1][2]
          if value + table[i-1][j-weight] > table[i-1][j]
            table[i][j] = value + table[i-1][j-weight]
          else
            table[i][j] = table[i-1][j]
          end
        else
          table[i][j] = table[i-1][j]
        end
      end
    end
    table
  end

  def maze_solver(maze, start_pos, end_pos)
    # bonus problem


    # each position may could go up, down, left, right
    if start_pos == end_pos
      return [end_pos]
    end
  end

end


