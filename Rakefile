require 'rake'

namespace :app do
    desc "Start the application"
    task :start do
        sh "bundle exec ruby app.rb"
    end

    desc "Run RSpec tests"
    task :test do
        sh "bundle exec rspec"
    end
end

# To start the app, run: rake app:start
# To run tests, run: rake app:test
