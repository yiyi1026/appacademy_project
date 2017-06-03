class HumanPlayer
  attr_reader :name
  def initialize(name = "Jack")
    @name = name
  end

  def prompt
    puts "Please guess a position."
  end

  def get_input
    gets.chomp.split(",").map(&:to_i)
  end



end
