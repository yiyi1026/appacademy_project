class Player
  attr_reader :name
  attr_accessor :hand, :pot
  def initialize(name)
    @name = name
    @hand = []
    @pot = 100

  end

  def get_action
    puts "What's your next move? f for fold, s for see, r for raise."
    gets.chomp.to_sym
  end

  

end
