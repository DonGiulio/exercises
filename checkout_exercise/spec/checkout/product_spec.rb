# frozen_string_literal: true

require './app/app.rb'

RSpec.describe Product do
  describe 'constructor' do
    context 'correct data' do
      let(:attributes) { { product_code: 'FR1', name: 'Fruit tea', price: 3.11 } }
      subject { Product.new(attributes) }

      it { expect(subject.product_code).to eq 'FR1' }
      it { expect(subject.name).to eq 'Fruit tea' }
      it { expect(subject.price).to be 3.11 }
    end

    context 'missing parameters' do
      let(:incomplete_attributes) { { name: 'Lavender heart', price: 9.25 } }

      it do
        expect { Product.new(incomplete_attributes) }.to raise_error ArgumentError
      end
    end
  end
end
