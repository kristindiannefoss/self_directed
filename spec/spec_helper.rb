require 'simplecov'
require 'database_cleaner'
require 'omniauth-github'
require 'shoulda-matchers'
require 'capybara'
require 'launchy'
require 'pry'
# require 'vcr'

SimpleCov.start("rails")

# VCR.configure do |c|
#   c.cassette_library_dir = "spec/cassettes"
#   c.hook_into :webmock
#   c.configure_rspec_metadata!
# end
#
# RSpec.configure do |config|
#
#   config.before(:suite) do
#     DatabaseCleaner.clean_with(:truncation)
#   end
#
#   config.before(:each) do
#     DatabaseCleaner.strategy = :transaction
#   end
#
#   config.before(:each) do
#     DatabaseCleaner.start
#   end
#
#   config.after(:each) do
#     DatabaseCleaner.clean
#   end
#
#   config.expect_with :rspec do |expectations|
#     expectations.include_chain_clauses_in_custom_matcher_descriptions = true
#   end
#
# end

OmniAuth.config.test_mode = true
OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
  :provider => 'github',
  :uid => '123545'
})
OmniAuth.config.add_mock(:github, {:uid => '12345'})

def mock_auth_hash
  OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
    "provider" => "github",
    "info" => {:user_name => "kristindiannefoss",
               :name => "Kristin Foss",
               :image => "https://avatars.githubusercontent.com/u/15794034?v=3",
               :location => "Denver, Colorado"}
      })
end

RSpec.configure do |config|
  # rspec-expectations config goes here. You can use an alternate
  # assertion/expectation library such as wrong or the stdlib/minitest
  # assertions if you prefer.
  config.expect_with :rspec do |expectations|
    # This option will default to `true` in RSpec 4. It makes the `description`
    # and `failure_message` of custom matchers include text for helper methods
    # defined using `chain`, e.g.:
    #     be_bigger_than(2).and_smaller_than(4).description
    #     # => "be bigger than 2 and smaller than 4"
    # ...rather than:
    #     # => "be bigger than 2"
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # rspec-mocks config goes here. You can use an alternate test double
  # library (such as bogus or mocha) by changing the `mock_with` option here.
  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist on
    # a real object. This is generally recommended, and will default to
    # `true` in RSpec 4.
    mocks.verify_partial_doubles = true
  end
end
