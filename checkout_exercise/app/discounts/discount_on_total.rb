# frozen_string_literal: true

module Discounts
  class DiscountOnTotal
    def initialize(discount, min_total)
      @discount = discount
      @min_total = min_total
    end

    def new_total(total, _products)
      total > @min_total ? total * (1 - @discount) : total
    end
  end
end
