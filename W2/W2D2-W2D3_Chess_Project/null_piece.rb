require_relative "piece"
require "singleton"

class NullPiece < Piece
  include Singleton

  def initialize(player = nil)
    @pos = nil
    super
  end

end
