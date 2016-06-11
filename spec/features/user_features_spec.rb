require 'rails_helper'

RSpec.describe "dashboard page", type: :feature do
  it "displays greeting box" do
    user = User.create(name: "John Smith", user_name: "jsmith", location: "Dallas, Texas")

    ApplicationController.any_instance.stub(:current_user).and_return(user)

    visit dashboard_path(user)

    expect(page).to have_content("°F in  #{user.location}")
  end

end

# visit dashboard_path(user)
