require 'game'
require 'rspec'

describe Game do
  subject(:game) {Game.new("Tom", "Jerry")}

  describe "#initialize" do
    it "initializes a new game" do
      expect(game.player1).to eq("Tom")
      expect(game.player2).to eq("Jerry")
      expect(game.deck.class).to eq(Deck)
    end
  end

  describe "#switch_players" do
    it "switches the current player to the next player" do
      game.switch_players
      expect(game.current_player).to eq("Jerry")
    end
  end
end
