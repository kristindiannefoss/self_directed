require 'rails_helper'

RSpec.describe "tasks index page", type: :feature do
  before(:each) do

    @user = User.create(
                    :uid => "15794034",
                    :token => "87f3add921d2843c62815c638487b244f2cb0973",
                    :user_name => "johnsmith",
                    :name => "John Smith",
                    :image => "https://avatars.githubusercontent.com/u/15794034?v=3",
                    :location => "Denver, Colorado")


    ApplicationController.any_instance.stub(:current_user).and_return(@user)

    @task1 = Task.new(description: "something good")
    @task2 = Task.new(description: "something bad")
    @user.tasks << @task1
    @user.tasks << @task2
  end

  it "displays a list of users tasks" do

    visit tasks_path(@user)

    expect(page).to have_content("#{@task1.description}")
    expect(page).to have_content("#{@task2.description}")
  end

end
