# require 'services_test_helper'
#
# class GithubServiceTest < ActiveSupport::TestCase
#   attr_reader :conn
#
#   def setup
#     @conn = GithubService.new
#   end
#
#   test "#user" do
#     VCR.use_cassette("github_service#user") do
#
#       info_hash = conn.user_info
#
#       assert_equal 0, info_hash.count
#     end
#   end
# end
