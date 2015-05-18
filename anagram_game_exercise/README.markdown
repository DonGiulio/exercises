## The exercise

Create an application to provide an anagram game, similar to the TV show Countdown.

The game is constructed with a random set of base letters a to z, e.g. the string "areallylongword". The player then attempts to create words out of the letters, and scores one point for each letter used. Letters cannot be used more than once. Whether or not the submission is a word should be checked by loading the word list `wordlist.txt` and confirming that the submitted word is in the list. For example, when starting with the base string "areallylongword": 

* "no" is an acceptable submission, with score 2
* "grow" is an acceptable submission, with score 4
* "bold" is not an acceptable submission
* "glly" is not an acceptable submission
* "woolly" is an acceptable submission with score 6
* "adder" is not an acceptable submission

The game should maintain in memory a list of the top ten highest-scoring submissions (word and score). 
Throughout this test, you need not worry about whitespace, special characters, or uppercase: you may assume that both the original string of letters and all submissions contain none of these.

There is no need to make a user interface: it is sufficient to implement the interface described in pseudo-Java below. If any of the instructions are unclear, make a reasonable assumption and document it with a comment.

Your implementation should be production quality. Use any tools, practices, resources, and information you would normally use to complete production-quality code. 

The time at which you started this test has been recorded. You have 2 hours to complete the test. We do not accept late submissions so please ensure you observe the time and send what you have completed at the end of 2 hours, even if incomplete.

    interface AnagramGame {
    
       /**
        * Submit a word on behalf of a user. A word is accepted if its letters are
        * contained in the original string submitted in the constructor, and if it
        * is in the word list at wordlist.txt.
        * If the word is accepted and its score is high enough, the submission
        * should be added to the high score list. If there are multiple submissions
        * with the same score, all are accepted, but the first submission with that
        * score should rank higher.
        *
        * @parameter word User's submission. All submissions may be assumed to be
        *             lowercase and containing no whitespace or special
        *             characters.
        */
       submitWord(string word);
     
       /**
        * Return word entry at given position in the high score list, 0 being the
        * highest (best score) and 9 the lowest. You may assume that this method
        * will never be called with position > 9.
        *
        * @parameter position Index on high score list
        * @return word entry at given position in the high score list, or null if
        *         there is no entry at that position
        */
       string getWordEntryAtPosition(integer position);
      
       /**
        * Return score at given position in the high score list, 0 being the
        * highest (best score) and 9 the lowest. You may assume that this method
        * will never be called with position > 9.
        *
        * @parameter position Index on high score list
        * @return score at given position in the high score list, or null if there
        *         is no entry at that position
        */
       integer getScoreAtPosition(integer position);
    }



# Running the tests

Steps to get the solution up and running:

1. unzip the file and cd to the newly created directory
2. run the 'bundle install --binstubs' command to install rspec and its executable bin
3. to run the tests run the command: 
    bin/rspec
4. expected output: 

        % rspec
        .....
        
        Finished in 4.78 seconds (files took 0.17653 seconds to load)
        5 examples, 0 failures
