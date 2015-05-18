class AnagramGame
  NUMBER_OF_WORDS_TO_FIND = 10
  
  def initialize(letters, dictionary)
    @dictionary = IO.readlines(dictionary)
    #remove endlines and sort the dictionary longest to shortes words
    @dictionary = @dictionary.map(&:chop).sort {|x,y| y.length <=> x.length}
    #all words that are longer than the list of letters are invalid. 
    @dictionary = @dictionary.delete_if {|word| word.length > letters.length}

    @letters = letters
    @top_words = []
  end
  
  # returns true if the word is valid
  #
  # checks if a word is valid for the game, 
  # it's valid if it's present in the dictionary and its letters are in the list. 
  def submit_word(word)
    return false unless @dictionary.include? word
    check_letters (word)
  end
  
  # returns a list of length NUMBER_OF_WORDS_TO_FIND with the top scoring words
  ## that satisfy the game's rules
  def top_scoring_words
    results = []
    found = 0
    @dictionary.each do |cur_word|
      break if found >= NUMBER_OF_WORDS_TO_FIND
      if check_letters cur_word
        results << cur_word
        found += 1
      end
    end
    return results
  end
  
  # returns the number of points for the word in the current game
  # or nil if the word is not a valid solution for the game
  def get_points(word)
    return nil unless submit_word word
    word.length
  end

private 
 def check_letters(word)
   word_letters = word.split ""
   cur_letters = @letters.clone
   word_letters.each do |l|
     return false unless cur_letters.include? l
     cur_letters.delete_at(cur_letters.index(l) || cur_letters.length)
   end
   return true
 end  
end
