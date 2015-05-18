require './app/app.rb'

RSpec.describe Product do
  it "generates a Product" do
    product = Product.new({product_code: "001", name: "Lavender heart", price: 9.25})
    expect(product.product_code).to eq "001"
    expect(product.name).to eq "Lavender heart"
    expect(product.price).to be 9.25
  end
  
  it "raises error if not all values are specified" do
    expect{ Product.new( {name: "Lavender heart", price: 9.25} ) }.to raise_error
  end

end
