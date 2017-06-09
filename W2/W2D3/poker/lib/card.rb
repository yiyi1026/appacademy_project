class Card
  CARDS = %w(2 3 4 5 6 7 8 9 10 J Q K A)
  SUITS = [:spade, :club, :diamond, :heart]

  attr_reader :number, :suit

  def initialize(number, suit)
    @number = CARDS[number-1]
    @suit = suit
  end

  def ==(other_card)
    number == other_card.number && suit == other_card.suit
  end

  def <=>(other_card)
    if self == other_card
      0
    elsif number != other_card.number
      CARDS.index(self.number) <=> CARDS.index(other_card.number)
    elsif suit != other_card.suit
      SUITS.index(suit) <=> SUITS.index(other_card.suit)
    end
  end
end
