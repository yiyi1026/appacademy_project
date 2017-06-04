
class Game
  @@record = Hash.new{0}
  attr_reader :dictionary
  attr_accessor :players, :fragment, :loser_hash, :loser_hash

  def initialize(players, fragment, dictionary)
    @players = players
    @fragment = fragment
    @dictionary = dictionary
    @loser_hash = Hash.new(0)
  end

  def run
    until loser_hash.any?{|k,v| v == 5}
      play_round
      losses(previous_player)
      @fragment = ''
    end
  end

  def play_round
    puts "\nA new turn!"
    until loss?
      puts "It is your turn, #{current_player.name}!"
      take_turn(current_player)
      next_player!
      puts "Let's switch"
    end
  end

  def current_player
    players[0]
  end

  def previous_player
    players[-1]
  end

  def next_player!
    @players = [players[1] , players[0]]
  end

  def take_turn(player)
    letter = player.guess
    letter_array = ('a'..'z').to_a + ("A".."Z").to_a
    until letter.length == 1  && letter_array.include?(letter)
      player.alert_invalid_guess
      letter = player.guess
    end

    if valid_play?(fragment+letter)
      fragment << letter
    else
      player.alert_invalid_guess
      take_turn(player)
    end
  end

  def valid_play?(string)
    dictionary.any? {|word,_| word.start_with?(string)}
  end

  def losses(player)

    loser_hash[player] += 1
    if loser_hash[player] == 5
      puts "Game over! #{player.name} is the GHOST"
    else
      puts "This round is over and #{player.name} loses this round."
      puts "current status: " + current_player.name + ":" + loser_hash[current_player].to_s + " " + previous_player.name + ":" + loser_hash[previous_player].to_s
    end
  end

  def loss?
    dictionary.any? {|word,_| word == fragment}
  end

  def self.record
    string = 'GHOST'
    hash={}
    @@record.each do |k,v|
      hash[k]==string[0..v]
    end
    hash
  end

end


class Player
  attr_reader :name
  attr_accessor :dictionary, :fragment

  def initialize(name)
    @name = name
  end

  def guess
    puts "Give me a letter!"
    gets.chomp
    # 'd'
  end

  def alert_invalid_guess
    puts "that's an invalid guess"
  end
end

if __FILE__ == $PROGRAM_NAME
  mary = Player.new("Mary")
  jack = Player.new("Jack")
  players=[mary,jack]
  dictionary={}
  File.foreach("dictionary.txt") do |line|
    a = line.chomp
    dictionary[a] = true
  end
  game = Game.new(players,'', dictionary)

  game.run
end


# p dictionary
