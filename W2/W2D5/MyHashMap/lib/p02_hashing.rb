class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  attr_accessor :hash
  def hash
    return @hash if @hash
    @hash = 0
    self.each do |el|
      @hash = el.hash + 31 * @hash
    end
    @hash
  end

end

class String
  attr_accessor :hash
  def hash
    return @hash if @hash
    @hash = 0
    self.each_char do |ch|
      @hash = ch.ord + 31 * @hash
    end
    @hash
  end
end

class Hash
  attr_accessor :hash

  def hash
    return @hash if @hash
    @hash = 0
    each do |key, value|
      @hash += key.hash + value.hash
    end
    @hash
  end
end
