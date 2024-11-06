# Issue Tracker

A simple command-line application for tracking issues, built with Ruby and SQLite. This app allows users to create, view, update, and delete issues, making it ideal for managing small tasks or tracking bugs in a straightforward way. [Read About My Ruby Journey](https://programmingthestreets.hashnode.dev/grand-hustle-upskillin-with-ruby)

## Features

- **Add Issues**: Easily add a new issue with title, description, status, and priority.
- **View Issues**: List all issues with their details.
- **Update Issues**: Modify the title, description, status, or priority of an existing issue.
- **Delete Issues**: Remove issues from the tracker.
- **Persistence with SQLite**: Issues are stored in a local SQLite database, so they’re retained between sessions.

## Getting Started

### Prerequisites

- **Ruby**: Ensure Ruby is installed. [Download Ruby](https://www.ruby-lang.org/en/downloads/)
- **SQLite3**: Ensure SQLite3 is installed. [SQLite Installation Guide](https://sqlite.org/download.html)
- **SQLite3 Gem**: Install the `sqlite3` gem.
- **Rspec**: Ensure Rspec is installed [Rspec Installation Guide](https://rspec.info/documentation/3.13/rspec-core/)
- **Rspec Gem**: Install the `Rspec` gem.

### Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/rlondon3/issue-tracker.git
   cd issue_tracker
   ```
2. **Install dependencies**:
   gem install sqlite3
   gem install rspec
   gem install rspec-core
3. **Run the app**
   rake app:start
4. **Run unit tests**
   rake app:test

### Usage

Follow the prompts to add, view, update, or delete issues.

### Future Enhancements

- **Refactor** the app with Ruby on Rails for a web-based interface.
- **Authentication** for multi-user support.
- **Vue** Front-end.
