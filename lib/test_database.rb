require "sqlite3"
require_relative 'migration'
require_relative 'issue'

class Database
    def initialize(db_name='issue_tracker_test.db')
        @db = SQLite3::Database.new(db_name)
        @migration = Migration.new(db_name)
        @migration.reset_db 
        setup_tables
    end

    def db
        @db
    end

    def setup_tables
        @db.execute <<-SQL
            CREATE TABLE IF NOT EXISTS issues (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                title VARCHAR(30),
                description VARCHAR(250),
                status VARCHAR(20),
                priority VARCHAR(20),
                created_date DATETIME DEFAULT CURRENT_TIMESTAMP,
                updated_date DATETIME DEFAULT CURRENT_TIMESTAMP,
                due_by DATE
            )
        SQL
    end

    def create_issue(issue)
        new_issue = @db.execute("INSERT INTO issues (title, description, status, priority)
                    VALUES (?, ?, ?, ?)", [issue.title, issue.description, issue.status, issue.priority])
        @db.last_insert_row_id
    end

    def get_issues
        result = @db.execute("SELECT * FROM issues")
        issues = result.map do |row|
            Issue.new(id: row[0], title: row[1], description: row[2], status: row[3], priority: row[4])
        end
        issues
    end

    def get_issue_by_id(id)
        result = @db.get_first_row('SELECT * FROM issues WHERE id = ?', [id])
        if result
            issue = Issue.new(
                id: result[0], 
                title: result[1], 
                description: result[2], 
                status: result[3], 
                priority: result[4], 
            )
        else
            nil 
        end
    end

    def update_issue(id, issue)
        updated_at = Time.now.to_s
        @db.execute("UPDATE issues SET title = COALESCE(?, title), 
            description = COALESCE(?, description),
            status = COALESCE(?, status), 
            priority = COALESCE(?, priority), 
            updated_date = ? 
            WHERE id = ?", 
            [issue.title, issue.description, issue.status, issue.priority, updated_at, id])
    end

    def delete_issue(id)
        @db.execute('DELETE FROM issues WHERE id = ?', [id])
    end
end



