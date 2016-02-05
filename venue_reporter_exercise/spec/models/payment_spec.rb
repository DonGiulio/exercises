require 'rails_helper'

RSpec.describe Payment, type: :model do
  let!(:venue) { create :venue }
  let(:payment) { Payment.first }
  
  it("can find the venue") { expect(payment.venue).to eq venue }
end
