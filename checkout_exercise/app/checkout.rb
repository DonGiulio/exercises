class Checkout
  
  def initialize(promotional_rules = [])
    @promotional_rules = promotional_rules
    @products = []
  end
  
  def scan(product)
    @products << product
  end
  
  def total
    total = 0.0
    @products.each { |product| total += product.price }
    @promotional_rules.each { |rule| total = rule.new_total(total, @products) }
    total.round(2).to_f
  end
end
