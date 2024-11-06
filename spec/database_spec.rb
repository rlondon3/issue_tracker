require_relative '../lib/issue_tracker'
require_relative '../lib/issue'
require_relative '../lib/database' 

RSpec.describe Database do
  it "initializes with a SQLite3 database" do
    db = Database.new
    issue_tracker = Issue_Tracker.new(db)
    
    expect(db.instance_variable_get(:@db)).to be_an_instance_of(SQLite3::Database)
  end
  it "gets issues from the database" do
    db = Database.new 
    issue_tracker = Issue_Tracker.new(db)

    db_issues = db.get_issues()

    expect(db_issues.length).to be > 0
  end
  it "gets an issue by id" do
    db = Database.new 
    issue_tracker = Issue_Tracker.new(db)

    issue = db.get_issue_by_id(5)
    expect(issue).to be_truthy
  end
  it "deletes an issue by id" do
    db = Database.new 
    issue_tracker = Issue_Tracker.new(db)

    issue = db.get_issue_by_id(60)
    expect(issue).to be_truthy

    db.delete_issue(4)
    deleted_issue = db.get_issue_by_id(1)
    expect(deleted_issue).to be_nil
  end

end
