require "colorize"
require_relative "board"
require_relative "cursor"

class Display

  def initialize
    @cursor = Cursor.new([0,0], board) # Where is board coming from?
  end

end
