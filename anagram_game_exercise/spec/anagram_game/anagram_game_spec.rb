require './app/app.rb'

RSpec.describe AnagramGame do
  let(:game) { AnagramGame.new("areallylongword".split(""), "wordlist.txt") }
  
  describe '#submit_word' do
    context "with a real word" do 
      let(:words) { %w"no grow woolly" }
      it { expect( words.map { |w| game.submit_word(w) } ).to all eq true }
    end

    context "with invalid words" do
      let(:words) { %w"bold glly adder" }
      it { expect( words.map { |w| game.submit_word(w) } ).to all eq false }
    end
  end
  
  describe '#top_scoring_words' do
    subject { game.top_scoring_words }
    let(:expected_words) {
      [
        "allowedly",
        "wrongdoer",
        "lowlander",
        "logroller",
        "logrolled",
        "earlywood",
        "laryngeal",
        "rollaway",
        "orangery",
        "narrowly"
      ]
    }
    it "returns a list of the top scoring words" do 
      expect(subject.length).to be 10
      expect(subject).to be_an Array
      expect(subject.map { |w| game.submit_word(w) } ).to all eq true
      expect(subject.map { |w| expected_words.include? w}).to all eq true
      expect(subject.inject(0) {|sum, word| sum + game.get_points(word) }).to eq 87
    end
  end

  describe '#get_points' do
    
    context "for high scoring words" do 
      let(:words) { game.top_scoring_words }

      it "verifies that a word is valid and returns its points" do
        words.map do |w|
          expect( game.get_points(w) ).to eq w.length
        end
      end
    end
    
    context "for a word with no score" do
      let(:words) { %w"bold glly adder" } 
      it "returns nil for a word without points" do
        expect( words.map { |w| game.get_points(w) } ).to all eq nil
      end
    end
  end
end