require 'deck'
require 'rspec'

describe Deck do
  subject(:new_deck) { Deck.new }
  describe "#initialize" do

    it "initializes a new deck" do
      expect(new_deck.deck.length).to eq(52)
    end

    it "initialize with all uniq cards" do
      expect(new_deck.deck.combination(2).any?{|a,b|a==b}).not_to be true
    end
  end
end
