require_relative 'card'

class Board
  attr_accessor :grid

  def initialize(grid = Array.new(4) { Array.new(4, nil) })
    @grid = grid
  end

  def populate
    card_array = []
    (1..grid.length**2 / 2).each do |card_face_value|
      card_array << Card.new(card_face_value, false)
      card_array << Card.new(card_face_value, false)
    end
    @grid = @grid.map do |row|
      row.map do |_|
        index = rand(0...card_array.length)
        card_array[index]
        card_array.delete_at(index)
      end
    end
  end

  def render
    grid.each do |row|
      row.each do |col|
        if col.face_up
          print col.face_value
        else
          print "*" * col.face_value.to_s.length
        end
      end
      puts "\n"
    end
  end

  def won?
    grid.all? do |row|
      row.all?(&:face_up)
    end
  end

  def reveal(guessed_pos)
    unless self[guessed_pos].face_up
      self[guessed_pos].reveal
      self[guessed_pos].face_value
    end
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  # def []=(pos)
  #
  # end


end
