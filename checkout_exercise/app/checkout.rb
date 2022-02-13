# frozen_string_literal: true

##
# scans items in a cart and calculates final price including offers and discounts
class Checkout
  attr_accessor :products, :promotional_rules

  ##
  # @param [Array] the discounts to apply
  def initialize(promotional_rules = [])
    @promotional_rules = promotional_rules
    @products = []
  end

  ##
  # @param [Product] a product in the cart
  def scan(product)
    @products << product
  end

  ##
  # calculates the final price
  # @return [Float] the total

  def total
    total = products.inject(0.0) { |sum, product| sum + product.price }
    total = promotional_rules.inject(total) do |cur_total, rule|
      rule.new_total(cur_total, products)
    end
    total.round(2)
  end
end
