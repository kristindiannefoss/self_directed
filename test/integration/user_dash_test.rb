
require "test_helper"

class UserLogsInWithTwitterTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  def setup
    Capybara.app = SelfDirected::Application
    stub_omniauth
  end

  test "logging in" do
    visit "/"
    assert_equal 200, page.status_code
    click_link "login"
    assert_equal "/", current_path
    assert page.has_content?("Horace")
    assert page.has_link?("logout")
  end

  def stub_omniauth
    # first, set OmniAuth to run in test mode
    OmniAuth.config.test_mode = true
    # then, provide a set of fake oauth data that
    # omniauth will use when a user tries to authenticate:
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      provider: 'github',
      extra: {
        raw_info: {
          uid: "1234",
          name: "Horace",
          nickname: "worace",
        }
      },
      credentials: {
        token: "pizza",
        secret: "secretpizza"
      }
    })
  end
end

# require 'test_helper'
#
# class UserDashTest < ActionDispatch::IntegrationTest
#   def setup
#     @user = User.create(
#                 :uid => "19",
#                 :user_name => "thisuser",
#                 :name => "Kristin Foss",
#                 :image => "https://avatars.githubusercontent.com/u/15794034?v=3",
#                 :followers_url => "https://api.github.com/users/kristindiannefoss/followers",
#                 :following_url => "https://api.github.com/users/kristindiannefoss/following{/other_user}",
#                 :location => "Denver, Colorado")
#
#                 ApplicationController.any_instance.stubs(:current_user).returns(@user)
#   end
#
#   test "login and see dashboard" do
#     get "/"
#
#     assert_response :success
#
#
#     click_link "Begin"
#
#     within("user_location") do
#       expect()
#     end
#
#   end
# end
