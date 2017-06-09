require 'rspec'
require 'hand'

describe Hand do
  let(:card1) {Card.new(1, :heart)}
  let(:card2) {Card.new(10, :diamond)}
  let(:card3) {Card.new(1, :spade)}
  let(:card4) {Card.new(10, :club)}
  let(:card5) {Card.new(1, :diamond)}
  let(:cards_inhand) {[card1,card2,card3,card4,card5]}
  subject(:hand) {Hand.new(cards_inhand)}

  describe "#initialize" do
    it "should hold five cards" do
      expect(hand.cards.length).to eq(5)
      expect(hand.cards).to eq(cards_inhand)
    end

  end

  describe "#take_card" do
    let(:new_card1){Card.new(3, :diamond)}
    it "should take a new card and discard an old card" do
      hand.take_card(new_card1)
      expect(hand.cards).not_to include(card1)
      expect(hand.cards).to include(new_card1)
    end
  end

  describe "#discard" do

    it "should discard card from a specifit position" do

    end
  end
end
