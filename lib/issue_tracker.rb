require_relative 'issue'
require_relative 'test_database'


class Issue_Tracker
    def initialize(database)
        @issues = []
        @db = database
    end

    def add_issue(title, description, status="open", priority="medium")
        issue = Issue.new(title: title, description: description, status: status, priority: priority)
        issue_id = @db.create_issue(issue)
        if issue_id
            issue.id = issue_id
            @issues << issue
            issue
        else
            nil
        end
    end

    def view_issues
        all_issues = @db.get_issues() || []
        if all_issues.empty?
            puts "Currently there are no issues."
            all_issues
        else
            all_issues.each(&:display)
            #@issues.each(&:display) #@issues.each { |issue| issue.display }
        end
    end

    def get_issue_by_id(id)
        issue = @issues.find { |i| i.id == id }

        unless issue
            issue = @db.get_issue_by_id(id)
            @issues << issue if issue 
        end
        issue
        #@issues.find { |issue| issue.id == id }
    end

    def update_issue(id, title = nil, description = nil, status = nil, priority = nil)
        issue = get_issue_by_id(id)
    
        if issue
            issue.title = title if title
            issue.description = description if description
            issue.status = status if status
            issue.priority = priority if priority
    
            @db.update_issue(id, issue)
            issue
        else
            nil 
        end
    end

    def delete_issue(id)
        issue = get_issue_by_id(id)
        if issue
            @db.delete_issue(id)
            @issues.delete(issue)
            return true
        else
            nil
        end
    end
    
end