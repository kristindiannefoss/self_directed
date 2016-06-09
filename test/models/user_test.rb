require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.create(
                :uid => "19",
                :user_name => "thisuser",
                :name => "Kristin Foss",
                :image => "https://avatars.githubusercontent.com/u/15794034?v=3",
                :followers_url => "https://api.github.com/users/kristindiannefoss/followers",
                :following_url => "https://api.github.com/users/kristindiannefoss/following{/other_user}",
                :location => "Denver, Colorado")
  end

  test "user can be created" do
    user = User.last

    assert_equal "19", user.uid
    assert_equal "thisuser", user.user_name

  end
end
