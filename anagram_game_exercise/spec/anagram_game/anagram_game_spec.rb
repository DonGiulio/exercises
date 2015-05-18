require './app/app.rb'
require 'pry'
RSpec.describe AnagramGame do
  before(:each) do
    @game = AnagramGame.new("areallylongword".split(""), "wordlist.txt")
  end
  
  describe "submit_word" do
    it "returns true if the word is in the dictionary" do
      words = %w"no grow woolly"
      words.each do |w|
        expect(@game.submit_word(w)).to be(true), "#{w} not found"
      end
    end
  
    it "returns false if the word is not in the dictionary" do
      words = %w"bold glly adder"
      words.each do |w|
        expect(@game.submit_word(w)).to be(false),  "#{w} found"
      end
    end
  end
  
  describe "top_scoring_words" do
    it "returns a list of the top scoring words" do 
      list = @game.top_scoring_words
      expect(list.length).to be 10
      list.each do |w|
        expect(@game.submit_word(w)).to be(true), "top word #{w}, wasn't allowed"
      end
    end
  end

  describe "get_points" do
    it "verifies that a word is valid and returns its points" do
      list = @game.top_scoring_words
      list.each do |w|
        expect(@game.get_points(w)).to be w.length
      end
    end
    
    it "returns nil for a word without points" do
      words = %w"bold glly adder"
      words.each do |w|
        expect(@game.get_points(w)).to be(nil),  "#{w} should not have points"
      end
    end
  end
end