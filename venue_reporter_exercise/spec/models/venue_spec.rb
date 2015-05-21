require 'rails_helper'

RSpec.describe Venue, type: :model do
  before(:each) do
    @venue = create :venue
  end
  
  it "has several tabs" do
    expect(@venue.tabs.size).to eq 5
  end
  
end
