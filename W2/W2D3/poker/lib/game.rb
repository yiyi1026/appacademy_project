class Game
  attr_reader :player1, :player2, :deck, :current_player, :pot

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @deck = Deck.new
    @current_player = player1
    @pot = 0
  end

  def switch_players
    @current_player = (current_player == player1) ? player2 : player1
  end

  def won?

  end

  def play_round

  end

  

end
