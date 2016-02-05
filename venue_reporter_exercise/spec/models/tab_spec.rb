require 'rails_helper'

RSpec.describe Tab, type: :model do
  let(:venue) { create :venue }
  let(:tab) { venue.tabs.first }
  
  it "has several users" do
    expect(tab.users.size).to be 5
  end
  
end
