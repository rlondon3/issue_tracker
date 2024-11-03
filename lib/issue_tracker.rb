require_relative 'issue'

class Issue_Tracker
    def initialize
        @issues = []
        @next_id = 1
    end

    def add_issue(title, description, status="open", priority="medium")
        issue = Issue.new(id: @next_id, title: title, description: description, status: status, priority: priority)
        @issues << issue
        @next_id += 1
    end

    def view_issues
        if @issues.empty?
            puts "Currently there are no issues."
        else
            @issues.each(&:display) #@issues.each { |issue| issue.display }
        end
    end

    def get_issue_by_id(id)
        @issues.find { |issue| issue.id == id }
    end

    def update_issue(id, title = nil, description = nil, status = nil, priority = nil)
        issue = get_issue_by_id(id)

        if issue
            issue.update(title: title, description: description, status: status, priority: priority)
            puts "Issue with ID #{id} has been updated successfully."
        else
            puts "Issue with Id #{id} not found!"
        end
    end

    def delete_issue(id)
        issue = issue.find(id)
        if issue
            @issues.delete(issue)
            puts "Issue with ID #{id} has been deleted successfully."
        else
            puts "Issue with ID #{id} not found!"
        end
    end
end