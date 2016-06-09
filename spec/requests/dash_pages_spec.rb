# require 'rails_helper'
#
#
#
# RSpec.describe "Dashboard", type: :request do
#   before(:each) do
#     @current_user = User.create(
#                 :uid => "19",
#                 :user_name => "thisuser",
#                 :name => "Kristin Foss",
#                 :image => "https://avatars.githubusercontent.com/u/15794034?v=3",
#                 :location => "Denver, Colorado")
#
#     #  = mock_model(user, :id => 1)
#     ApplicationController.stub(:current_user).and_return(@current_user)
#     # controller.stub!(:login_required).and_return(:true)
#   end
#
#   describe "GET /dashboard" do
#     it "displays user information" do
#
#       get dashboard_path(@current_user)
#
#       expect(response).to have_http_status(200)
#       expect(page).to have_content("Kristin Foss")
#     end
#   end
# end
