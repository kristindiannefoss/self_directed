require 'rails_helper'

RSpec.describe "tasks index page", type: :feature do
  it "displays a list of users tasks" do
    user = User.create(name: "John Smith", user_name: "jsmith", location: "Dallas, Texas")

    ApplicationController.any_instance.stub(:current_user).and_return(user)

    task1 = Task.new(description: "something good")
    task2 = Task.new(description: "something bad")
    user.tasks << task1
    user.tasks << task2

    visit tasks_path(user)

    expect(page).to have_content("#{task1.description}")
    expect(page).to have_content("#{task2.description}")
  end
end
