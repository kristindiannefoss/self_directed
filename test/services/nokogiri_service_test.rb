require 'test_helper'

class NokogiriServiceTest < ActiveSupport::TestCase
  attr_reader :noko

  def setup
    @noko = NokogiriService.new
    @user = User.create(
                :uid => "15794034",
                :token => "",
                :user_name => "kristindiannefoss",
                :name => "Kristin Foss",
                :image => "https://avatars.githubusercontent.com/u/15794034?v=3",
                :location => "Denver, Colorado")
  end

  # test "todays_commits" do
  #     todayscommits = noko.todays_commits
  #
  #     assert_equal 0, todayscommits
  # end
end
