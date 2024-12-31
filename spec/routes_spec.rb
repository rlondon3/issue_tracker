require 'rack/test'
require 'rspec'
require_relative '../lib/routes'
require_relative '../lib/test_database'

RSpec.describe Routes do
  include Rack::Test::Methods
  before(:all) do
    @migration = Migration.new
    Routes.set :environment, :test
    Routes.set :bind, '0.0.0.0' 
  end
  after(:all) do
    @migration.reset_db
  end

  def app
    Routes 
  end

  it "uses Sinatra and connects with Puma" do
    get '/' 

    expect(last_response).to be_ok
    expect(last_response.body).to eq("Sinatra connected with puma...")
  end

  it "should add an issue" do
    issue_data = {
        title: "Sample Issue",
        description: "This is a sample issue description",
        status: "open",
        priority: "high"
    }.to_json
    
    post '/add-issue', issue_data, { "CONTENT_TYPE" => "application/json" }
    response_data = JSON.parse(last_response.body)
    expect(last_response.status).to eq(201)
  end

  it "should get an issue by id" do
    get '/issue/3'
    response_data = JSON.parse(last_response.body)
    expect(last_response.status).to eq(201)
  end

  it 'should update an issue' do
    updated_issue_data = {
        description: "This is an updated sample issue description",
        status: "open",
        priority: "high"
    }.to_json

    put '/update-issue/3',  updated_issue_data, { "CONTENT_TYPE" => "application/json" }
    response_data = JSON.parse(last_response.body)

    expect(last_response.status).to eq(201)
  end

  it 'should delete an issue' do
    delete "/delete-issue/3", {}, { "CONTENT_TYPE" => "application/json" }
    expect(last_response.status).to eq(200)
  end
end