# frozen_string_literal: true

module Discounts
  class NewPriceOnMultipleBuy
    attr_accessor :promoted_product, :min_products, :new_price

    def initialize(promoted_product, min_products, new_price)
      @promoted_product = promoted_product
      @min_products = min_products
      @new_price = new_price
    end

    def new_total(total, products)
      products_found = products.count { |p| p.eql? promoted_product }
      if products_found >= min_products
        total -= (promoted_product.price - new_price) * products_found
      end
      total
    end
  end
end
