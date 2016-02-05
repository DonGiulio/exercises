require "rails_helper"

RSpec.describe VenueReport, :type => :feature do
  let!(:venues) { create_list :venue, 5 } 
  let(:reporter) { VenueReport.new(initial_date, final_date) }

  describe '#generate' do
    subject {reporter.generate}
    
    context "date objects" do
      let(:initial_date) { 3.days.ago}
      let(:final_date) { 2.days.ago}
          
      it "Generates a new report" do
        expect(subject).to be_an Array
        expect(subject.size).to eq venues.size
        expect(subject).to all be_a VenueRow
      end
      
      it "the reports are sorted" do
        check = subject.dup.sort_by! {|o| o.value}.reverse
        expect(check).to eq subject
      end
    end
    
    context "string dates" do
      let(:initial_date) { 3.days.ago.to_s}
      let(:final_date) { 2.days.ago.to_s}

      it "generates a new report" do
        expect(subject).to be_an Array
        expect(subject.size).to eq venues.size
        expect(subject).to all be_a VenueRow
      end
      
      it "the reports are sorted" do
        check = subject.dup.sort_by! {|o| o.value}.reverse
        expect(check).to eq subject
      end
    end    
  end
end