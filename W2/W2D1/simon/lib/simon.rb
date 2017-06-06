class Simon
  COLORS = %w(red blue green yellow)
  DICT = {"r"=>"red", "g"=> "green", "b"=> "blue", "y" => "yellow"}
  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []

  end

  def play
    take_turn until game_over

    game_over_message
    reset_game

  end

  def take_turn
    show_sequence
    require_sequence
    unless game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color

  end

  def require_sequence
    puts "please input your guess, r for red, b for blue
      g for green and y for yellow."
    input = gets.chomp.chars.map(&:downcase)
    raise 'Input Error' unless self.class.valid_input(input)
    input.each_with_index do |color, idx|
      @game_over = true unless seq[idx] == DICT[color]

    end

  end

  def self.valid_input?(input)

    input.each do |color|
      return false unless DICT[color]
    end

    true
  end

  def add_random_color
    # @sequence_length += 1
    @seq << COLORS.sample

  end

  def round_success_message
    puts "Round successful. Next sequence:"
  end

  def game_over_message
    puts "Game over!"

  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
