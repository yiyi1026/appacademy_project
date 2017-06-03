require_relative "tile.rb"
require "byebug"
class Board
  attr_accessor :grid

  def initialize(grid = Board.from_file("sudoku1-almost.txt"))
    @grid = grid
  end

  def self.from_file(file_name)
    grid = Array.new(9) { Array.new}
    File.foreach(file_name).with_index do |line,idx|
      line.chomp.chars.map do |num|
        grid[idx] << Tile.new(num.to_i)
      end
    end
    grid
  end

  def render
    grid.each do |row|
      row.each do |col|
        print col.value
      end
      puts "\n"
    end
  end

  def solved?

    grid.each_index do |row|
      temp = []
      grid[row].each_index do |col|
        p self[[row,col]].class
        temp << self[[row,col]].value
      end
      return false unless temp.sort == (1..9).to_a
    end

    grid.transpose.each do |row|
      temp = []
      row.each do |col|
        temp << col.value
      end
      return false unless temp.sort == (1..9).to_a
    end

    small_box.each do |box|
      return false unless box.sort == (1..9).to_a
    end
    true
  end

  def small_box
      all_boxes = []

      rows = [[0,1,2],[3,4,5],[6,7,8]]
      cols = [[0,1,2],[3,4,5],[6,7,8]]

      rows.each do |row|
        cols.each do |col|
          temp = []
          row.each do |row_index|
            col.each do |col_index|
              temp << self[[row_index, col_index]].value
            end
          end
          all_boxes << temp
        end
      end
      all_boxes
  end

  def []=(pos, value)
    row, col = pos
    grid[row][col].value = value
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end
end
