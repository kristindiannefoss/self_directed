require 'rails_helper'

describe 'login' do

  before do
    @user = User.create(
                    :uid => "15794034",
                    :token => "87f3add921d2843c62815c638487b244f2cb0973",
                    :user_name => "kristindiannefoss",
                    :name => "Kristin Foss",
                    :image => "https://avatars.githubusercontent.com/u/15794034?v=3",
                    :location => "Denver, Colorado")

    ApplicationController.any_instance.stub(:current_user).and_return(@user)
  end

    it "authenticates a user" do
      visit root_path

      expect(page).to have_content("Kristin Foss")
    end

end
