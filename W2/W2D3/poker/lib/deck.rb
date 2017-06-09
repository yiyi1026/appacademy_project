class Deck
  attr_accessor :deck

  def initialize(deck=Deck.new_deck)
    @deck = deck
  end

  def self.new_deck
    deck = []
    suits = [:spade, :club, :diamond, :heart]
    suits.each do |suit|
      (1..13).each do |num|
        deck << Card.new(num, suit)
      end
    end
    deck.shuffle
  end

end
