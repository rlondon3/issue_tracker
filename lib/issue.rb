class Issue
    attr_accessor :id, :title, :description, :status, :priority, :created_at, :updated_at

    def initialize(id:, title:, description:, status: "Open", priority: "medium")
        @id =  id
        @title = title
        @description = description
        @status = status
        @priority = priority
        @created_at = Time.now
        @updated_at = Time.now
    end

    def display
        puts "ID: #{@id}"
        puts "Title: #{@title}"
        puts "Description: #{@description}"
        puts "Status: #{@status}"
        puts "Priority: #{@priority}"
        puts "Created At: #{@created_at}"
        puts "Updated At: #{@updated_at}"
        puts "-" * 20
    end
    
    def update(title: @title, description: @description, status: @status, priority: @priority)
        @title = title if @title != @title
        @description = description if @description != @description
        @status = status if @status != @status
        @priority = priority if !priority != @priority
    end
end