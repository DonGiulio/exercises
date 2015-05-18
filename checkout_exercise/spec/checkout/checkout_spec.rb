require './app/app.rb'

RSpec.describe Checkout do
  before(:each) do
    @products = [ 
      Product.new( {product_code: "001", name: "Lavender heart", price: 9.25} ),
      Product.new( {product_code: "002", name: "Personalised cufflinks", price: 45.00} ),
      Product.new( {product_code: "003", name: "Kids T-shirt", price: 19.95} )
    ]
    @promotional_rules = [
      NewPriceOnMultipleBuy.new(@products[0], 2, 8.50), 
      DiscountOnTotal.new(0.1, 60.0)
    ]
  end

  def checkout(cart, promotions)
    co = Checkout.new(promotions)
    cart.each { |item| co.scan(item) }
    return co
  end
  
  it "applies a 10% discount on purchases over 60.00" do
    cart = [@products[0], @products[1], @products[2]]
    expected_price = 66.78
    co = checkout cart, @promotional_rules
    expect(co.total).to be(expected_price)
  end
  
  it "lavender for only 8.50 if two or more are bought" do
    cart = [@products[0], @products[2], @products[0]]
    expected_price = 36.95
    co = checkout cart, @promotional_rules
    expect(co.total).to be(expected_price)
  end

  it "applies a cumulative discount" do
    cart = [@products[0], @products[1], @products[0], @products[2]]
    expected_price = 73.76
    co = checkout cart, @promotional_rules
    expect(co.total).to be(expected_price)
  end
  
  it "applies no discount if no promotions are active" do
    cart = [@products[0], @products[1], @products[0], @products[2]]
    expected_price = 83.45
    co = checkout cart, []
    expect(co.total).to be(expected_price)
  end

end
