class Tile

  attr_accessor :given,:value

  def initialize(value)
    @value = value
    @given = (value == 0 ? false : true)
  end


end
