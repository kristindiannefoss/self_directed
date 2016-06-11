class TasksController < ApplicationController
  before_action :set_user
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  attr_reader :user

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = @user.tasks.create(task_params)
    redirect_to tasks_path
  end

  def edit
  end

  def update
    @task.update(task_params)
    redirect_to tasks_path
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

    def set_user
      @user = current_user #User.find(params[:id])
    end

    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:id, :description, :user_id, :image_url)
    end
end
