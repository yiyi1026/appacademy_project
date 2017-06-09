class Hand
  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def discard
    puts "Which card do you wish to discard?"
    new_hand = []
    input = gets.chomp.split(",").map(&:to_i)
    cards.length.times do |i|
      new_hand << cards[i] unless input.include?(i)
    end
    @cards = new_hand
  end

  def take_card(new_card)
    discard
    @cards << new_card
  end


end
