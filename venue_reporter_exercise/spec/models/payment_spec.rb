require 'rails_helper'

RSpec.describe Payment, type: :model do
  before(:each) do
    @venue = create :venue
    @payment = Payment.first
  end
  
  it "can find the venue" do
    expect(@payment.venue).to eq @venue
  end
end
