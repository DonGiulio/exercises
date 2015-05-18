# The exercise
The exercise was timed and using an online web interface where I could see: 

* the rspec test file (available here at `spec/date_range_formatter/date_range_formatter_spec.rb`). 
* and the following class: 

          class DateRangeFormatter
         
            attr_reader :start_on, :end_on, :starting_time, :ending_time
          
            def initialize start_on, end_on, starting_time = nil, ending_time = nil
              @start_on = Date.parse(start_on)
              @end_on = Date.parse(end_on)
              @starting_time, @ending_time = starting_time, ending_time
            end  
          end
        
          class Fixnum
            def ordinalize
                if (11..13).include?(self.abs % 100)
                  "#{self}th"
                else
                  case self.to_i.abs % 10
                    when 1; "#{self}st"
                    when 2; "#{self}nd"
                    when 3; "#{self}rd"
                    else    "#{self}th"
                  end
                end
              end
          end

The exercise was to update the `DateRangeFormatter` to get all the tests to be successful. The exercise was in two phases: 

1. the first phase was timed, I was required to fix the code as quickly as possible (I managed to complete it in 80 minutes)
2. Once the tests were successful the timer would stop and I could update my solution to improve the style, readability and performance of my solution. 

The solution presented in this package (`./app/date_range_formatter.rb`) is the final solution from the second phase. 
Additionally I used `guard` and `pry` to continuously run the tests and to debug my code.

# Running the tests

Steps to get the solution up and running:

1. unzip the file and cd to the newly created directory
2. run the `bundle install --binstubs` command to install rspec and its executable bin
3. to run the tests run the command: `bin/rspec`
4. expected output: 

        % rspec
        Run options: include {:focus=>true}
        
        All examples were filtered out; ignoring {:focus=>true}
        ............
        
        Finished in 0.00462 seconds
        12 examples, 0 failures
        
        Randomized with seed 10656
