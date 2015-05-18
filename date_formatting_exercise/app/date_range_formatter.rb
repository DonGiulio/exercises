class DateRangeFormatter
  
  attr_reader :start_on, :end_on, :starting_time, :ending_time
  
  def initialize start_on, end_on, starting_time = nil, ending_time = nil
    @start_on = Date.parse(start_on)
    @end_on = Date.parse(end_on)
    @starting_time, @ending_time = starting_time, ending_time
  end
  
  def to_s
    if starting_time? 
      starting = f_date_time(@start_on, @starting_time)
      
      if ending_time?
        # starting and ending time
        ending = f_date_time(@end_on, @ending_time)
        if same_day? then "#{starting} to #{@ending_time}"
        else "#{starting} - #{ending}"
        end
      else
        # starting but NO ending time
        if same_day? then starting
        else "#{starting} - #{f_date(@end_on)}"
        end
      end
      
    else
      # no starting or ending times
      case 
      when same_day?   then f_date(@start_on)
      when same_month? then "#{start_on.day.ordinalize} - #{f_date(@end_on)}"
      when same_year?  then "#{f_date(@start_on, false)} - #{f_date(@end_on)}"
      else                  "#{f_date(@start_on)} - #{f_date(@end_on)}"
      end
    end
  end
  
  private
  
  def f_date_time(date, time)
    "#{f_date(date)} at #{time}"
  end
  def f_date(date, year=true)
    if year 
      date.strftime("#{date.day.ordinalize} %B %Y")
    else 
      date.strftime("#{date.day.ordinalize} %B")
    end
  end

  def starting_time? 
    ! @starting_time.nil?
  end
  def ending_time?
    ! @ending_time.nil?
  end
  
  def same_day?
    @start_on == @end_on
  end
  def same_month?
    @start_on.month == @end_on.month && @start_on.year == @end_on.year
  end
  def same_year?
    @start_on.year == @end_on.year
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