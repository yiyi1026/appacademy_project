class ComputerPlayer
  attr_reader :name
  attr_accessor :known_cards, :matched_cards, :grid

  def initialize(name,grid = ComputerPlayer.blankboard)
    @name = name
    @known_cards = Hash.new {|h,k| h[k] = []}
    @matched_cards = []
    @grid = grid
  end

  def self.blankboard
    grid = []
    4.times do |idx_row|
      4.times do |idx_col|
        grid << [idx_row, idx_col]
      end
    end
    grid
  end

  def prompt
    puts "Please guess a position."
  end

  def get_input(previous_guess)
    # p previous_guess
    # p previous_guess.class
    if previous_guess.nil?
      pos = paired_guess
    else
      pos = find_pair(previous_guess)
    end
    pos
  end

  def receive_revealed_card(pos, face_value)
    # p "postion #{pos}"
    unless known_cards[face_value].include?(pos)
      @known_cards[face_value] += [pos]
      # @grid = @grid.reject { |position| position == pos }
    end

  end

  def receive_match(pos1, pos2)
    @matched_cards << pos1
    @matched_cards << pos2
    @grid = @grid.reject { |position| position == pos1 || position == pos2 }
  end

  def paired_guess
    pair = @known_cards.select { |_, v| v.length > 1 }
      # p "pair.length"
    # p pair.length

    if pair.empty?
      available_pos
      # p "available"
      # p available_pos
    else
      pair.each { |_, v| return v.sample}
    end
  end

  def find_pair(previous_guess)
    guess = @known_cards.select { |_, v| v.include?(previous_guess) }.values.flatten(1)
    p "guess"
    p guess
    p "length"
    p guess.length
    if guess.length > 1
      guess.reject{|position| position == previous_guess}
    else
      available_pos
    end
  end

  def available_pos
    temp = grid.sample
    temp
  end


end
