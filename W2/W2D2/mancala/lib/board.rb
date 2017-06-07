class Board
  attr_accessor :cups
  attr_reader :player1, :player2

  def initialize(name1, name2)
    @player1 = name1
    @player2 = name2
    @cups = Array.new(14){Array.new}
    place_stones
  end

  def place_stones
    @cups.map.with_index do |cup, index|
      if index == 6 || index == 13
        next
      else
        @cups[index] += [:stone] * 4
      end
    end
    @cups
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless ((1..6).to_a+(8..13).to_a).include?(start_pos)
    true
  end

  def make_move(start_pos, current_player_name)
    available = @cups[start_pos]
    @cups[start_pos] = []
    index = start_pos
    until available.empty?
      index += 1
      move = index % cups.length
      if move == 6
        @cups[6] << available.pop if player1 == current_player_name
      elsif move == 13
        @cups[13] << available.pop if player2 == current_player_name
      else
        @cups[move] << available.pop
      end
    end
    render
    next_turn(index % cups.length)

  end

  def next_turn(idx)
    # helper method to determine what #make_move returns
    if idx == 6 || idx == 13
      :prompt
    elsif @cups[idx].count == 1
      :switch
    else
      idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].all?(&:empty?) || @cups[7..12].all?(&:empty?)
  end

  def winner
    sum1 = @cups[6].map(&:length).reduce(0,:+)
    sum2 = @cups[13].map(&:length).reduce(0,:+)
    case sum1 <=> sum2
    when 1
      player1
    when 0
      :draw
    else
      player2
    end
  end
end
