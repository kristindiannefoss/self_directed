# class OrdersController < ApplicationController
#   attr_reader :customer
#
#   def index
#     @customer = customer.find_by(params[:id])
#     @orders = customer.orders.all
#   end
#
#   def show
#     @order = customer.orders.find(:id)
#   end
# end











class TasksController < ApplicationController
  attr_reader :user

  def index
    @user = current_user
    @tasks = @user.tasks.all
  end

  def show
    @task = user.tasks.find(:id)
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
