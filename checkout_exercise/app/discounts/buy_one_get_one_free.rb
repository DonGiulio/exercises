module Discounts
  class BuyOneGetOneFree
  
    attr_accessor :promoted_product, :min_products, :free_products
  
    def initialize(promoted_product, min_products, free_products)
      @promoted_product = promoted_product
      @min_products = min_products
      @free_products = free_products
    end
  
    def new_total(total, products)
      products_found = products.count { |p| p.eql? promoted_product }
      free_products = products_found / min_products
      total -= free_products * promoted_product.price
    end
  end
end