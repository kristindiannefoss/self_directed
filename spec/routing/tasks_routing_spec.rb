require 'rails_helper'

RSpec.describe "routing to tasks", :type => :routing do

  before(:each) do
      @controller = TasksController.new
      @user = User.create(
                      :uid => "15794034",
                      :token => "87f3add921d2843c62815c638487b244f2cb0973",
                      :user_name => "johnsmith",
                      :name => "John Smith",
                      :image => "https://avatars.githubusercontent.com/u/15794034?v=3",
                      :location => "Denver, Colorado")

      @task1, @task2 = @user.tasks.create!, @user.tasks.create!
    end

  it "routes to tasks#index for user" do
    expect(:get => "/user/#{@user.id}/tasks").to route_to(
      :controller => "tasks",
      :action => "index",
      :id => "#{@user.id}"
    )
  end

  it "routes to tasks#create for user" do
    expect(:post => "/user/#{@user.id}/tasks").to route_to(
      :controller => "tasks",
      :action => "create",
      :id => "#{@user.id}"
    )
  end

  it "routes to tasks#new for user" do
    expect(:get => "/user/#{@user.id}/tasks/new").to route_to(
      :controller => "tasks",
      :action => "new",
      :id => "#{@user.id}"
    )
  end

  it "routes to tasks#edit for user" do
    expect(:get => "/user/#{@user.id}/tasks/#{@task1.id}/edit").to route_to(
      :controller => "tasks",
      :action => "edit",
      :id => "#{@task1.id}"
    )
  end

  it "routes to tasks#destroy for user" do
    expect(:delete => "/user/#{@user.id}/tasks/#{@task1.id}").to route_to(
      :controller => "tasks",
      :action => "destroy",
      :id => "#{@task1.id}"
    )
  end

  it "does not expose a list of tasks" do
    expect(:get => "/tasks").not_to be_routable
  end
end
