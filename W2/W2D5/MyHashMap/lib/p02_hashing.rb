class Fixnum
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
    each_char do |ch|
      @hash = ch.ord + 31 * @hash
    end
    @hash
  end
end

class Hash

  def hash
    @hash = 0
    each do |key, value|
      @hash += key.hash + value.hash
    end
    @hash
  end
end
