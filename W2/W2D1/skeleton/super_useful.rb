# PHASE 2
def convert_to_int(str)
  begin
    int = Integer(str)
  rescue ArgumentError
    puts "Could not convert"
  ensure
    int ||= nil
  end

end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else
    raise StandardError
  end
end

def feed_me_a_fruit
  count = 0
  begin
    puts "Hello, I am a friendly monster. :)"
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue
    if maybe_fruit == "coffee" && count == 0
      puts "You chose coffee. Try again."
      count += 1
      retry
    else
      puts "Well, no more chances."
    end
  end
end

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    raise "No name" if name.empty?
    @fav_pastime = fav_pastime
    raise "No favorite pasttime" if fav_pastime.empty?
    @yrs_known = yrs_known
    raise "we are not there yet!" if yrs_known < 5
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
end
