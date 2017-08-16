class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    @hash = 0
    each do |el|
      @hash = el.hash + 31 * @hash
    end
    @hash
  end
end

class String
  def hash
    @hash = 0
    each_char do |el|
      @hash = el.ord + 31 * @hash
    end
    @hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    @hash = 0
    keys.sort.each do |key|
      @hash = key.to_s.ord + 31 * @hash
      @hash = self[key].to_s.ord + 31 * @hash
    end
    @hash
  end
end
