require 'spec_helper'
require './app/app.rb'

describe Checkout do
  
  context "with discount on total promotion" do
    let(:lavender) { Product.new product_code: "001", name: "Lavender heart", price: 9.25 }
    let(:cufflinks) { Product.new product_code: "002", name: "Personalised cufflinks", price: 45.00 }
    let(:tshirt) { Product.new product_code: "003", name: "Kids T-shirt", price: 19.95}
    
    let(:promotions) do
      [
        Discounts::NewPriceOnMultipleBuy.new(lavender, 2, 8.50), 
        Discounts::DiscountOnTotal.new(0.1, 60.0)
      ]
    end
    
    let(:checkout) { Checkout.new(promotions) }
    
    before { cart.each { |item| checkout.scan(item) } }
    
    context "purchase over 60.00" do
      let(:cart) { [lavender, cufflinks, tshirt] }
      it("applies a 10% discount") { expect(checkout.total).to eq(66.78) }
    end

    context "two or more lavender" do
      let(:cart) { [lavender, tshirt, lavender] }
      it("lavender for only 8.50") { expect(checkout.total).to eq(36.95) }
    end

    context "over 60.00 and with two lavender" do
      let(:cart) { [lavender, cufflinks, lavender, tshirt] }
      it("applies a cumulative discount") { expect(checkout.total).to eq(73.76) }
    end
    
    context "no promotions" do
      let(:cart) { [lavender, cufflinks] }
      it("applies no discount") { expect(checkout.total).to eq(54.25) }
    end
  end
  
  context "with buy one get one free promotion" do
    let(:fr1) { Product.new(product_code: "FR1", name: "Fruit tea", price: 3.11) }
    let(:ap1) { Product.new(product_code: "AP1", name: "Apple", price: 5.00) }
    let(:cf1) { Product.new(product_code: "CF1", name: "Coffee", price: 11.23) }

    let(:promotions) do 
      [
        Discounts::NewPriceOnMultipleBuy.new(ap1, 3, 4.50), 
        Discounts::BuyOneGetOneFree.new(fr1, 2, 1)
      ]
    end

    let(:checkout) { Checkout.new(promotions) }
    before { cart.each { |item| checkout.scan(item) } }

    context "no discounts" do
      let(:cart) { [fr1, ap1, ap1, cf1] }
      it { expect(checkout.total).to eq 24.34 }
    end

    context "combined offer" do 
      let(:cart) { [fr1, ap1, ap1, fr1, ap1] }    
      it { expect(checkout.total).to eq 16.61 }    
    end

    context "buy one fruit, get one free" do
      context "single offer" do
        let(:cart) { [fr1, fr1] }
        it { expect(checkout.total).to eq 3.11 }
      end
  
      context "multiple offer" do
        let(:cart) { [fr1, fr1, fr1, fr1] }
        it { expect(checkout.total).to eq 6.22 }
      end
  
      context "partial multiple" do 
        let(:cart) { [fr1, fr1, fr1] }  
        it { expect(checkout.total).to eq 6.22 }
      end
    end

    context "new price on 3 or + apples" do
      let(:cart) { [ap1, ap1, fr1, ap1] }
      it { expect(checkout.total).to eq 16.61 }
    end
  end
end
