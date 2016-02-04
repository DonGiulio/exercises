class Checkout
  
  attr_accessor :products, :promotional_rules
  
  def initialize(promotional_rules = [])
    @promotional_rules = promotional_rules
    @products = []
  end
  
  def scan(product)
    @products << product
  end
  
  def total
    total = products.inject(0.0) { |sum, product| sum + product.price }
    total = promotional_rules.inject(total) { |total, rule| rule.new_total(total, products) }
    total.round(2)
  end
end
