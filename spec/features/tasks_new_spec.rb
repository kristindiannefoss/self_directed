require 'rails_helper'

RSpec.describe "tasks index page", type: :feature do
  before(:each) do
    user = User.create(name: "John Smith", user_name: "jsmith", location: "Dallas, Texas")

    ApplicationController.any_instance.stub(:current_user).and_return(user)

    task1 = Task.new(description: "something good")
    task2 = Task.new(description: "something bad")
    user.tasks << task1
    user.tasks << task2
  end

  it "can create a new task" do

    visit tasks_path(user)
    click_on("Create New")
    expect(path).to eq(new_task_path)
    expect(page).to have_content("Create A New Task")
    fill_in "Description", with: "do laundry"
    click_on("Save")
    expect(page).to have_content("Saved, your new task is")
  end

end
