# frozen_string_literal: true

class Product
  @@attributes = %i[product_code name price]

  @@attributes.each { |a| attr_accessor a }

  def initialize(hash)
    unless @@attributes.all? { |a| hash.key? a }
      raise ArgumentError, 'missing parameters'
    end

    @@attributes.each { |a| send("#{a}=", hash[a]) }
  end
end
