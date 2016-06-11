class TasksController < ApplicationController
  attr_reader :user

  def index
    @user = current_user #User.find(params[:id])
    @tasks = Task.all
  end

  def show
    # @task = user.tasks.find(:id)
  end

  def new
  end

  def create
    @task = user.tasks.create(task_params)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def task_params
      params.require(:tasks).permit(:id, :description, :user_id, :image_url)
    end
end
