# String Compression exercise

## Goal
The goal of this exercise is to implement a string compression / decompression algorithm, two methods compress and decompress. 

The compression should be so that it satisfies the spec tests given. 

## Note
The original exercise had fewer testcases and had hidden extra checks for some edge cases, I deduced these extra edge cases and wrote explicit tests for these. 

## How to execute the test suite
* run `bundle install` in the directory where you installed the exercise into, 
* run `rspec spec/` in the same directory, 

the output should be similar to: 

    % rspec spec

    Compressor
      #compress
        should ==
        should ==
        should == a
        should == aa
        should == a3
        should == describe
        should == a3
        should == a3bbc3
        should == ab4c3
      #decompress
        should == aaa
        should == aaabbccc
        should == aaaaaaaaaaab
        should == describe
        should == abbbbccc
        should == a
        should == aaab
        should == a
        should == aa
        should == aaa
        should ==
        should ==
        should == aaaaa

    Finished in 0.00571 seconds
    22 examples, 0 failures
    
