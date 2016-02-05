class AnagramGame
  WORDS_TO_FIND = 10
  
  def initialize(letters, dictionary)
    @dictionary = prepare_dictionary dictionary, letters.length
    @letters = letters
  end
  
  # returns true if the word is valid
  #
  # checks if a word is valid for the game, 
  # it's valid if it's present in the dictionary and its letters are in the list. 
  def submit_word(word)
    letters_present_for(word) && @dictionary.include?(word)
  end
  
  # returns a list of length NUMBER_OF_WORDS_TO_FIND with the top scoring words
  ## that satisfy the game's rules
  def top_scoring_words
    return @dictionary.inject([]) do |words_found, cur_word|
      return words_found if words_found.length >= WORDS_TO_FIND
      words_found << cur_word if letters_present_for cur_word
      words_found
    end
  end
  
  # returns the number of points for the word in the current game
  # or nil if the word is not a valid solution for the game
  def get_points(word)
    return nil unless submit_word word
    word.length
  end

  private

  #reads the dictionary file, deletes the impossible strings and sorts by length
  def prepare_dictionary(dictionary, length)
    result = IO.readlines(dictionary).map(&:chop)
    result.delete_if {|word| word.length > length}
    result.sort! {|x,y| y.length <=> x.length}
  end

  def letters_present_for(word)
    cur_letters = @letters.clone
    word.split("").each do |letter|
      return false unless cur_letters.include? letter
      cur_letters.delete_at(cur_letters.index(letter))
    end
    return true
  end  
end
