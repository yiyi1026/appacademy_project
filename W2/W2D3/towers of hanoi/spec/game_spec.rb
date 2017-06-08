require 'game'
require 'rspec'

describe Game do
  subject(:towers) {Game.new}

  describe "#initialize" do
    it "initializes the piles of discs" do
      expect(towers.piles).to eq([[3,2,1],[], []])
    end
  end

  describe "#move" do
    before(:each) {towers.move(0, 2)}

    it "moves disc when valid" do
      expect(towers.piles[0]).to eq([3,2])
    end

    it "moves disc to the right position" do
      expect(towers.piles[2]).to eq([1])
    end
  end

  describe "#won?" do
    it "returns true when won" do
      towers.piles = [[],[],[3,2,1]]
      expect(towers.won?).to be true
    end
  end
end
