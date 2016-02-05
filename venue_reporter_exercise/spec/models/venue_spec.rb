require 'rails_helper'

RSpec.describe Venue, type: :model do
  let(:venue) { create :venue }

  it("has several tabs") { expect(venue.tabs.size).to eq 5 }
end
