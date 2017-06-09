require 'card'
require 'rspec'

describe Card do
  subject(:card) {Card.new(10, :heart)}

  describe "#initialize" do
    it "initializes a new card with a suit" do
      expect(card.number).to eq("10")
      expect(card.suit). to eq(:heart)
    end

  end
end
