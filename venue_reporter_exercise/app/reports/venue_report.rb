class VenueReport
  
  # Initialises the report, the parameters can be either +DateTime+ or +String+
  def initialize(initial_date, final_date)
    initial_date = initial_date.to_datetime if initial_date.class == String
    final_date = final_date.to_datetime if final_date.class == String
    @payments = Payment.where(date: initial_date..final_date)
  end
  
  # Generates a report as an array of VenueRow
  def generate
    
    # iterates through each payment found in the time interval generating the 
    # hash version of the report. Finally converts the hash to the Array of 
    # +VenueRow+s
    obj = @payments.each_with_object({}) do |p, obj|
      venue_name = "#{p.venue.name}"

      venue = obj[venue_name]
      if venue
        transactions = venue[:transactions] + 1
        value = venue[:value] + p.amount
      end
      transactions ||= 1
      value ||= p.amount
        
      obj[venue_name] = { transactions: transactions, value: value }
    end
    
    result = venue_rows obj
    result.sort_by! {|o| o.value}.reverse
  end
  
  private 
  
  # Converts the hash report +{venue: {transactions: X, value: Y}}+ to the 
  # equivalent in +VenueRow+ version
  def venue_rows(hash)
    hash.map do |venue_name, values|
      VenueRow.new(name: venue_name, 
        transactions: values[:transactions], 
        value: values[:value])
    end
  end
  
end
