# frozen_string_literal: true

##
# Anagram Game, to find anagrams of words and rates
# them on their length
class AnagramGame
  WORDS_TO_FIND = 10

  def initialize(letters, dictionary)
    @dictionary = prepare_dictionary dictionary, letters.length
    @letters = letters
  end

  # returns true if the word is valid
  #
  # checks if a word is valid for the game,
  # it's valid if it's present in the dictionary and
  # its letters are in the list.
  #
  # @param [String, word] the word to submit
  # @return [Bool] true if the word is accepted
  def submit_word(word)
    letters_present_for(word) && @dictionary.include?(word)
  end

  ##
  # returns a list of length WORDS_TO_FIND with the top scoring words
  # that satisfy the game's rules
  def top_scoring_words
    @dictionary.each_with_object([]) do |cur_word, words_found|
      return words_found if words_found.length >= WORDS_TO_FIND

      words_found << cur_word if letters_present_for cur_word
    end
  end

  # returns the number of points for the word in the current game
  # or nil if the word is not a valid solution for the game
  def get_points(word)
    return nil unless submit_word word

    word.length
  end

  private

  ##
  # reads the dictionary file, deletes the impossible
  # strings and sorts by length
  def prepare_dictionary(dictionary, length)
    result = IO.readlines(dictionary).map(&:chop)
    result.delete_if { |word| word.length > length }
    result.sort_by!(&:length).reverse!
  end

  def letters_present_for(word)
    array_difference(word.split(''), @letters) == []
  end

  # remove each element of subtrahend from minuend exactly once
  def array_difference(minuend, subtrahend)
    result = minuend.dup
    subtrahend.each do |element|
      idx = result.index(element)
      result.delete_at(idx) if idx
    end
    result
  end
end
