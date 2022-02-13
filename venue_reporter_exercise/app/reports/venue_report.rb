# frozen_string_literal: true

class VenueReport
  # Initialises the report, the parameters can be either +DateTime+ or +String+
  def initialize(initial_date, final_date)
    initial_date = initial_date.to_datetime if initial_date.instance_of?(String)
    final_date = final_date.to_datetime if final_date.instance_of?(String)
    @payments = Payment.where(date: initial_date..final_date)
  end

  # Generates a report as an array of VenueRow
  def generate
    # iterates through each payment found in the time interval generating the
    # hash version of the report. Finally converts the hash to the Array of
    # +VenueRow+s
    rows = @payments.each_with_object({}) do |payment, cur_result|
      venue_name = payment.venue.name.to_s

      venue = cur_result[venue_name]
      if venue
        transactions = venue[:transactions] + 1
        value = venue[:value] + payment.amount
      end
      transactions ||= 1
      value ||= payment.amount

      cur_result[venue_name] = { transactions: transactions, value: value }
    end

    result = venue_rows rows
    result.sort_by!(&:value).reverse
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
