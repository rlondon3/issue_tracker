require_relative '../lib/issue_tracker'
require_relative '../lib/issue'
require_relative '../lib/database' 

RSpec.describe Issue_Tracker do
  it "initializes with @issues and @db variables" do
    db = Database.new 
    issue_tracker = Issue_Tracker.new(db)
    
    expect(issue_tracker.instance_variable_get(:@issues)).to eq([])
    expect(issue_tracker.instance_variable_get(:@db)).to eq(db)
  end
  it "adds an issue with title, description, status, and priority" do
    db = Database.new 
    issue_tracker = Issue_Tracker.new(db)
    issue_tracker.add_issue("Test", "Test description", "Test status", "Test priority")

    expect(issue_tracker.instance_variable_get(:@issues).length).to be > 0
  end
  it "gets the correct values for added issues" do
    db = Database.new 
    issue_tracker = Issue_Tracker.new(db)
    issue_tracker.add_issue("Test", "Test description", "Test status", "Test priority")

    added_issue = issue_tracker.instance_variable_get(:@issues).first

    expect(added_issue.title).to eq("Test")
    expect(added_issue.description).to eq("Test description")
    expect(added_issue.status).to eq("Test status")
    expect(added_issue.priority).to eq("Test priority")
  end
end
