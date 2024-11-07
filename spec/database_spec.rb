require_relative '../lib/issue_tracker'
require_relative '../lib/issue'
require_relative '../lib/test_database' 

RSpec.describe Database do
    before(:each) do
        @migration = Migration.new
        @migration.reset_db
    end

    after(:each) do
        @migration.reset_db
    end
  it "initializes with a SQLite3 database" do
    db = Database.new
    issue_tracker = Issue_Tracker.new(db)
    
    expect(db.instance_variable_get(:@db)).to be_an_instance_of(SQLite3::Database)
  end
  it "gets issues from the database" do
    db = Database.new 
    issue_tracker = Issue_Tracker.new(db)
    issue_tracker.add_issue("Test", "Test description", "Test status", "Test priority")

    db_issues = db.get_issues()

    expect(db_issues.length).to be > 0
  end
  it "gets an issue by id" do
    db = Database.new 
    issue_tracker = Issue_Tracker.new(db)
    issue_tracker.add_issue("Test", "Test description", "Test status", "Test priority")

    issue = db.get_issue_by_id(1)
    expect(issue).to be_truthy
  end
  #add test to make sure the issue is being updated
  it "updates an issue by id" do
    db = Database.new
    issue_tracker = Issue_Tracker.new(db)
    issue_tracker.add_issue("Test", "Test description", "Test status", "Test priority")

    issue = db.get_issue_by_id(1)
    if issue
        issue.title = "updated title"
        issue.description = "updated description" 
        issue.status = "updated status" 
        issue.priority = "updated priority"
        issue.updated_at = Time.now.to_s

        db.update_issue(1, issue)
        updated_issue = db.get_issue_by_id(1)

        expect(updated_issue.title).to eq("updated title")
        expect(updated_issue.description).to eq('updated description')
    end

  end
  it "deletes an issue by id" do
    db = Database.new 
    issue_tracker = Issue_Tracker.new(db)
    issue_tracker.add_issue("Test", "Test description", "Test status", "Test priority")

    issue = db.get_issue_by_id(1)
    expect(issue).to be_truthy

    db.delete_issue(1)
    deleted_issue = db.get_issue_by_id(1)
    expect(deleted_issue).to be_nil
  end
end
