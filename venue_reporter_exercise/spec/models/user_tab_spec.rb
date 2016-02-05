require 'rails_helper'

RSpec.describe UserTab, type: :model do
  
  let(:tab) { create :tab }
  
  it("has several users") { expect(tab.users.size).to be 5 }
  it("has several user_tabs") { expect(tab.user_tab.size).to be 5 }
  
  it "each user tab has several payments" do
    expect( tab.user_tab.map { |cur| cur.payments.size } ).to all be > 0
  end
  
end
