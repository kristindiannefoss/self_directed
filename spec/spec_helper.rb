require 'simplecov'
require 'database_cleaner'
require 'omniauth-github'
require 'shoulda-matchers'
require 'capybara'
require 'launchy'
require 'pry'
require 'vcr'
require 'factory_girl'

SimpleCov.start("rails")

ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

RSpec.configure do |config|

  config.before :each do
    OmniAuth.config.mock_auth[:github] = nil
    OmniAuth.config.test_mode = true
    # OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
    #                 "provider" => 'github',
    #                 :uid => ENV["BM_UID"],
    #                 :info => { "name" => 'kris', "email" => 'kris.foss@gmail.com', "nickname" => 'kristindiannefoss', "image" => '"https"//avatars.githubusercontent.com/u/13123158?v=3' },
    #                 'credentials' => { "token" => ENV["TOKEN"] },
    #                 "extra" => { "raw_info" => {"location" => "Denver, Colorado"}}
    # })
    OmniAuth.config.mock_auth[:github] = {
                                          :provider => 'github',
                                          :uid => '1234567',
                                          'credentials' => { 'token'=>'3nkjnie' },
                                          :info => { "nickname" => 'test',
                                                      :email =>  'info@gmail.com',
                                                      'name' => 'Test User'},
                                          'extra' => { "raw_info" =>
                                                    { 'location' => 'Los Angeles, California'}}}
  end

  def generate_user
    User.create(provider: "github", uid: ENV["KF_UID"], nickname: "kristindiannefoss", email: "kris.foss@gmail.com", name: "Kris", image: "https://avatars.githubusercontent.com/u/13123158?v=3", token: ENV["TOKEN"])
  end

  config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  require File.expand_path("../../config/environment", __FILE__)
end
