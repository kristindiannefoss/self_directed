require 'rails_helper'

describe "NokogiriService" do
  before do
    @user = User.create(
                    :uid => "15794033",
                    :token => "87f3add921d2843c62815c638487b244f2cb0973",
                    :user_name => "johnsmith",
                    :name => "John Smith",
                    :image => "https://avatars.githubusercontent.com/u/15794034?v=3",
                    :location => "Denver, Colorado")

    ApplicationController.any_instance.stub(:current_user).and_return(@user)
    
    @service = NokogiriService.new(@user)
  end

    it "gets a number of commits from webpage" do
        noko1 = @service.todays_commits
        expect(noko1).to be_a(Integer)
    end

end
