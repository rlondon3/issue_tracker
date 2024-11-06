require 'sqlite3'

class Migration
    def initialize(db_name='issue_tracker_test.db')
        @db_name = db_name
        @db = SQLite3::Database.new(db_name)
    end

    def create_tables
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

    def drop_tables
        @db.execute("DROP TABLE IF EXISTS issues")
    end

    def reset_db
        drop_tables
        create_tables
    end
end
