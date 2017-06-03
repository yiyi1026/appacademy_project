require "set"

class WordChainer

  def self.readfile(dic_file)
    words = File.readlines(dic_file).map(&:chomp)
    Set.new(words)
  end

  attr_reader :dic, :all_seen_words, :current_words
  # attr_accessor :current_words

  def initialize(dic_file)
    @dic = WordChainer.readfile(dic_file)
    @current_words = []
    @all_seen_words = []
  end

  def adjacent_words(word)
    dic.select{|lookup| adjacent?(lookup,word)}
  end

  def adjacent?(word_one,word_two)
    return false unless word_one.length == word_two.length
    zipped_words = word_one.chars.zip(word_two.chars)
    difference = zipped_words.count { |a, b| a!=b}
    difference == 1
  end

  def run(source, target)
    dic_map = {}
    current_words << source
    all_seen_words << source
    until current_words.empty?
      new_current_words = []
      current_words.each do |current_word|
        adjacent = adjacent_words(current_word)
        adjacent.each do |word|
          unless all_seen_words.include?(word)
            dic_map[word] = current_word
            if word == target
              dic_map
              p root_finder(dic_map, source, target)
              return "success"
            end
            new_current_words << word
            all_seen_words << word
          end
        end
      end
      new_current_words
      @current_words = new_current_words
    end
  end

  def root_finder(hash, source, target)
    path = [target]
    until source == target
      word = hash[target]
      path << word
      target = word
    end
    path.reverse!
  end

end

test = WordChainer.new("dictionary.txt")
test.run("duck", "ruby")
