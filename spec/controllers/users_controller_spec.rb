require 'rails_helper'


RSpec.describe UsersController, type: :controller do
  before do
    @user =  User.create(uid: ENV["KF_UID"], user_name: "kristindiannefoss", name: "Kris", image: "https://avatars.githubusercontent.com/u/13123158?v=3", token: ENV["TOKEN"], location: "Denver, Colorado")
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:github]
    @temp = "72"

  end

    describe "GET show" do
      it "has a 200 status code" do
        get :show, id: @user.id
        expect(response.status).to eq(200)
      end
    end

  before do
    @user.tasks << Task.create(description: "You should test the controller")
  end


end
