require "rails_helper"

RSpec.describe VenueReport, :type => :feature do
  before(:each) do
    @venues = create_list :venue, 5
  end
  
  it "Generates a new report" do
    initial_date = 3.days.ago
    final_date = 2.days.ago
    reporter = VenueReport.new(initial_date, final_date)
    report = reporter.generate
    
    expect(report.class).to be Array
    expect(report.size).to be @venues.size
    expect(report.first.class).to be VenueRow
  end
  
  it "accepts dates as string" do
    initial_date = 3.days.ago.to_s
    final_date = 2.days.ago.to_s
    reporter = VenueReport.new(initial_date, final_date)
    report = reporter.generate
    
    expect(report.class).to be Array
    expect(report.size).to be @venues.size
    expect(report.first.class).to be VenueRow
  end
  
  it "generates reports that are sorted" do
    initial_date = 3.days.ago.to_s
    final_date = 2.days.ago.to_s
    reporter = VenueReport.new(initial_date, final_date)
    report = reporter.generate

    check = report.dup
    expect(check.sort_by! {|o| o.value}.reverse).to eq report
  end
  
end