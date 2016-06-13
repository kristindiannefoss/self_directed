require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  before do
    @user = User.create(
                    :uid => "15794033",
                    :token => "87f3add921d2843c62815c638487b244f2cb0973",
                    :user_name => "johnsmith",
                    :name => "John Smith",
                    :image => "https://avatars.githubusercontent.com/u/15794034?v=3",
                    :location => "Denver, Colorado")

    ApplicationController.any_instance.stub(:current_user).and_return(@user)
  end

  describe "GET new" do
    it "starts a session with login"
      get :create
      
  end

end
