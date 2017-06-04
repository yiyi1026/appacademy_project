class Tile

  attr_accessor :value, :hidden, :flag

  def initialize(value=0)
    @value = value
    @hidden = true
    @flag = false
  end
end