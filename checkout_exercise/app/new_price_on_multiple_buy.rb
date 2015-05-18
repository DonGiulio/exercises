class NewPriceOnMultipleBuy
  
  def initialize(promoted_product, min_products, new_price)
    @promoted_product = promoted_product
    @min_products = min_products
    @new_price = new_price
  end
  
  def new_total(total, products)
    products_found = 0
    products.each do |cur_product|
      products_found += 1 if cur_product.eql? @promoted_product
    end
    total -= (@promoted_product.price - @new_price) * products_found if products_found >= @min_products
    return total
  end
end