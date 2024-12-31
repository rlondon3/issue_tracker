require 'sinatra/base'
require 'sqlite3'
require 'json'
require_relative 'issue_tracker'


class Routes < Sinatra::Base
    db = Database.new
    issue_tracker = Issue_Tracker.new(db)

    get '/' do
        "Sinatra connected with puma..."
    end

    get '/issues' do
        issues = issue_tracker.view_issues()
        if issues.length > 0
            status 201
            issues.to_json
        else
            status 404
            {error: 'No issues found'}.to_json
        end
    end

    get '/issue/:id' do
        issue = issue_tracker.get_issue_by_id(params[:id])

        if issue
            status 201
            issue.to_json
        else
            status 404
            {error: 'Issue not found'}.to_json
        end
    end

    post '/add-issue' do
        request_data = JSON.parse(request.body.read)

        title = request_data['title']
        description = request_data['description']
        status = request_data['status'] || 'open'
        priority = request_data['priority'] || 'medium'

        new_issue = issue_tracker.add_issue(title, description, status, priority)
        
         if new_issue 
            status 201 
            new_issue.to_json
        else
            status 500
            {error: 'Issue could not be added'}.to_json
        end
    end

    put '/update-issue/:id' do
        request_data = JSON.parse(request.body.read)

        title = request_data['title']
        description = request_data['description']
        status = request_data['status'] || 'open'
        priority = request_data['priority'] || 'medium'

        updated_issue = issue_tracker.update_issue(params[:id], title, description, status, priority)

        if updated_issue
            status 201
            updated_issue.to_json
        else
            status 500
            {error: 'Issue could not be updated'}
        end

    end

    delete '/delete-issue/:id' do
        id = params[:id]
        deleted_issue = issue_tracker.delete_issue(id)
        
        if !deleted_issue
            status 200
            { message: 'Issue deleted'}.to_json
        else
            status 404
            { error: 'Issue was not deleted or was not found'}
        end
    end

end