class VenueRow
  attr_reader :name, :transactions, :value
  
  def initialize (attributes)
    @name = attributes[:name]
    @transactions = attributes[:transactions]
    @value = attributes[:value]
  end
end
