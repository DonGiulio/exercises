require 'rails_helper'

RSpec.describe UserTab, type: :model do
  
  before(:each) do 
    @tab = create :tab
  end
  
  it "has several users" do 
    expect(@tab.users.size).to be 5
  end
  
  it "has several user_tabs" do
    expect(@tab.user_tab.size).to be 5
  end
  
  it "each user tab has several payments" do 
    @tab.user_tab.each do |tab|
      expect(tab.payments.size).to be > 0
    end
  end
  
end
