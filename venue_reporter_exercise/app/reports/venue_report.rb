class VenueRow
  attr_reader :name, :transactions, :value
  
  def initialize (attributes)
    @name = attributes[:name]
    @transactions = attributes[:transactions]
    @value = attributes[:value]
  end
end


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
    hash_result = {}
    @payments.each do |p|
      key = "#{p.venue.name}"

      venue = hash_result[key]
      if venue
        transactions = venue[:transactions] + 1
        value = venue[:value] + p.amount
      end
      transactions ||= 1
      value ||= p.amount
        
      hash_result[key] = { transactions: transactions, value: value }
    end
    
    result = venue_rows hash_result
    result.sort_by! {|o| o.value}.reverse
  end
  
  private 
  
  # Converts the hash report +{venue: {transactions: X, value: Y}}+ to the 
  # equivalent in +VenueRow+ version
  def venue_rows(hash)
    hash.map do |key, values|
      VenueRow.new(name: key, transactions: values[:transactions], value: values[:value])
    end
  end
  
end
