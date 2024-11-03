require_relative 'lib/issue'
require_relative 'lib/issue_tracker'
require_relative 'lib/database'

issue_tracker = Issue_Tracker.new

loop do
    puts "\nIssue Tracker"
    puts "1. Add a new issue"
    puts "2. View all issues"
    puts "3. Update an issue"
    puts "4. Delete an issue"
    puts "5. Exit"

    user_choice = gets.chomp.to_i
    print " user choice #{user_choice}"
    case user_choice
    when 1
        puts "Enter issue title: "
        title = gets.chomp
        puts "Enter issue description: "
        description = gets.chomp
        puts "Enter issue status: "
        status = gets.chomp
        puts "Enter issue priority: "
        priority = gets.chomp
        
        issue_tracker.add_issue(title, description, status, priority)
        puts "Issue added successfully!"

    when 2
        issue_tracker.view_issues 
    when 3
        puts "Enter issue ID to update: "
        id = gets.chomp.to_i
        puts "Enter new title: "
        new_title = gets.chomp
        puts "Enter new description: "
        new_description = gets.chomp
        puts "Enter new status: "
        new_status = gets.chomp
        puts "Enter new priority: "
        new_priority = gets.chomp

        issue_tracker.update(id, new_title, new_description, new_priority, new_status)
        puts "Issue added successfully!"
    when 4
        puts "Enter issue ID to delete: "
        id = gets.chomp.to_i
        puts "Enter issue description"

        issue_tracker.delete_issue(id)
        puts "Issue added successfully!"
    when 5
        puts "Existing Issue Tracker: "
        break
    else
        puts "Invalid option! Please choose between 1-4."
    end
end
