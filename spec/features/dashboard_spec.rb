# require 'rails_helper'
#
# describe 'GithubService' do
#   before do
#     user = User.create(
#                     :uid => "15794034",
#                     :token => "87f3add921d2843c62815c638487b244f2cb0973",
#                     :user_name => "kristindiannefoss",
#                     :name => "Kristin Foss",
#                     :image => "https://avatars.githubusercontent.com/u/15794034?v=3",
#                     :location => "Denver, Colorado")
#   end
#
#   context "info" do
#     it "brings in user info" do
#       VCR.use_cassette("user_info") do
#         users_info = @service.info
#
#         expect(users_info[:name]).to eq("Kristin Foss")
#       end
#     end
#   end
#
# end
